class BrandDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :link_to, :h, :content_tag, :edit_references_brand_path, :references_brand_path

  def sortable_columns
    @sortable_columns ||= %w(Brand.id Brand.title Brand.created_at)
  end

  def searchable_columns
    @searchable_columns ||= %w(Brand.title)
  end

  private

  def data
    records.map do |record|
      [
        record.id,  
        record.title,
        I18n.l(record.created_at, format: :default),
        link_to(content_tag(:i, '', class: 'fa fa-edit'), edit_references_brand_path(record), class: 'btn btn-app-small'),
        link_to(content_tag(:i, '', class: 'fa fa-remove'), references_brand_path(record), method: :delete, class: 'btn btn-app-small btn-danger', data: { confirm: "Вы действительно хотите удалить брэнд?" })
      ]
    end
  end

  def get_raw_records
    Brand.all
  end  
end
