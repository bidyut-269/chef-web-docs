module AccordionHelpers
  def accordion(id, title, active=false, &block)
    concat(
      content_tag(:dl, class: "accordion", "data-accordion" => "") do
        content_tag(:dd, class: "accordion-navigation" + (active ? " active" : "") ) do
          output = []
          output << link_to("#{title} <i class='fa fa-angle-double-right'></i>", "##{id}")
          output << content_tag(:div, {id: id, class: "box content" + (active ? " active" : ""), style: "border:none;"}, false) do
            capture(&block)
          end
          output.join
        end
      end
    )
  end

  def exercise_question(question)
    concat(
      content_tag(:div, class: 'exercise-question') do
        question
      end
    )
  end
end