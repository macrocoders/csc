class UserDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :link_to, :h, :content_tag, :edit_references_user_path, :references_user_path

  def sortable_columns
    @sortable_columns ||= %w(User.id User.first_name User.last_name User.created_at)
  end

  def searchable_columns
    @searchable_columns ||= %w(User.first_name User.last_name)
  end

  private

  def data
    records.map do |record|
      [
        record.id,  
        record.last_name,
        record.first_name,
        record.middle_name,
        record.email,
        I18n.l(record.created_at, format: :default),
        link_to(content_tag(:i, '', class: 'fa fa-edit'), edit_references_user_path(record), class: 'btn btn-app-small'),
        link_to(content_tag(:i, '', class: 'fa fa-remove'), references_user_path(record), method: :delete, class: 'btn btn-app-small btn-danger', data: { confirm: "Вы действительно хотите удалить сотрудника?" })
      ]
    end
  end

  def get_raw_records
    User.all
  end  
end
