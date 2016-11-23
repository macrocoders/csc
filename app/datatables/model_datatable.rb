class ModelDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :link_to, :h, :content_tag, :edit_references_model_path, :references_model_path

  def sortable_columns
    @sortable_columns ||= %w(Model.id Brand.title Model.title Model.created_at)
  end

  def searchable_columns
    @searchable_columns ||= %w(Model.title)
  end

  private

  def data
    records.map do |record|
      [
        record.id,
        record.brand.title,  
        record.title,
        I18n.l(record.created_at, format: :default),
        link_to(content_tag(:i, '', class: 'fa fa-edit'), edit_references_model_path(record), class: 'btn btn-app-small'),
        link_to(content_tag(:i, '', class: 'fa fa-remove'), references_model_path(record), method: :delete, class: 'btn btn-app-small btn-danger', data: { confirm: "Вы действительно хотите удалить модель?" })
      ]
    end
  end

  def get_raw_records
    Model.includes(:brand).all
  end  
end
