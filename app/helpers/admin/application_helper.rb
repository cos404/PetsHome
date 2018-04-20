module Admin::ApplicationHelper

  def sortable(column, title = nil)
    column = column.to_s
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, {sort: column, direction: direction}, {class: css_class}
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render("fields_" + association.to_s.singularize, f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def button_add_fields(content, f, association, _class = nil)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render("fields_" + association.to_s.singularize, f: builder)
    end
    _class ||= ""
    _class = _class + " add_fields"
    options = {'name' => 'button', class: _class, data: {id: id, fields: fields.gsub("\n", "")}}
    content_tag :button, content, options
  end
end
