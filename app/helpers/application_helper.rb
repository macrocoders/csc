module ApplicationHelper
 def page_title(title)
   content_for(:page_title) { title }
 end
 
 def modal_title(title)
   content_for(:modal_title) { title }
 end
 
 def modal_search_form_action(action)
   content_for(:modal_search_form_action) { action }
 end 
 
 def modal_create_new_link(link)
   content_for(:modal_create_new_link) { link }
 end          
 
 def error_messages(resource)
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
      <h2>#{sentence}</h2>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
 end
end
