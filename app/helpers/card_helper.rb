module CardHelper
  def field_value(card, field)
    card.fields.find { |f| f['name'] == field }.try(:[], 'value')
  end
end
