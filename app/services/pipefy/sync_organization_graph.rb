module Pipefy
  class SyncOrganizationGraph
    def initialize(organization_id: 114095, pipe_id: 423922)
      @client = Pipefy::Client.new
      @graph = Pipefy::Query.organization
      @criteria = {
        organization_id: organization_id,
        pipe_id: pipe_id
      }
    end

    def perform
      data = @client.query(@graph, @criteria)
      organization = sync_organization(data)
      pipe = sync_pipe(data, organization)
      phases = sync_phases(data, pipe)
      sync_cards(data, phases)
    end

    private

    def sync_organization(data)
      create_or_update_entity(Organization, organization_attributes(data))
    end

    def sync_pipe(data, organization)
      create_or_update_entity(Pipe, pipe_attributes(data), organization)
    end

    def sync_phases(data, pipe)
      phases_attributes(data).map { |p| create_or_update_entity(Phase, p, pipe) }
      destroy_unreceived_entities(Phase, phases_attributes(data).map { |p| p['pipefy_id'] })
    end

    def sync_cards(data, phases)
      cards_attributes(data).each do |c|
        phase = phases.select { |p| p.pipefy_id == c.dig('node', 'current_phase', 'id').to_i }.first
        create_or_update_entity(Card, c['node'].except('current_phase'), phase)
      end
      destroy_unreceived_entities(Card, cards_attributes(data).map { |p| p.dig('node', 'pipefy_id') })
    end

    def create_or_update_entity(entity, attributes, parent = nil)
      return if attributes.nil?

      attributes.merge!("#{parent.model_name.element}_id": parent.id) if parent.present?
      entity.where(pipefy_id: attributes['pipefy_id'])
            .first_or_create(attributes)
            .tap { |o| o.update(attributes) if o.persisted? }
    end

    def destroy_unreceived_entities(entity, received_entity_pipefy_ids)
      entity.where.not(pipefy_id: received_entity_pipefy_ids).destroy_all
    end

    # paths inside received data hash
    # to required Pipefy entities

    def organization_attributes(data)
      data.except('pipes')
    end

    def pipe_attributes(data)
      data.dig('pipes', 0).except('phases')
    end

    def phases_attributes(data)
      data.dig('pipes', 0, 'phases').map { |p| p.except('cards') }
    end

    def cards_attributes(data)
      data.dig('pipes', 0, 'phases').map { |p| p.dig('cards', 'edges') }.flatten
    end
  end
end
