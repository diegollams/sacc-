module InteractionsHelper
  def ul_list(elements)
    elements.reject! { |element| element.empty? }
    content_tag :ul do
      elements.collect { |element| concat(content_tag(:li, element))}
    end
  end
end
