module Pipefy
  class Query
    def self.organization
      <<~GRAPHQL
        query($organization_id: ID!, $pipe_id: ID) {
          organization(id: $organization_id) {
            pipefy_id: id
            name
            pipes (ids: [$pipe_id]) {
              pipefy_id: id
              name
              start_form_fields {
                pipefy_id: id
                label
              }
              phases {
                pipefy_id: id
                name
                fields {
                  label
                  id
                }
                cards {
                  edges {
                    node {
                      pipefy_id: id
                      title
                      created_on_pipefy_at: created_at
                      due_at: due_date
                      current_phase {
                        id
                      }
                      fields {
                        name
                        value
                      }
                    }
                  }
                }
              }
            }
          }
        }
      GRAPHQL
    end
  end
end
