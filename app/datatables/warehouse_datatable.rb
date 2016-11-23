class WarehouseDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :link_to, :h, :content_tag, :edit_references_warehouse_path, :references_warehouse_path

  def sortable_columns
    @sortable_columns ||= %w(Warehouse.id Warehouse.title User.first_name Warehouse.created_at)
  end

  def searchable_columns
    @searchable_columns ||= %w(Warehouse.title)
  end

  private

  def data
    records.map do |record|
      [
        record.id,  
        record.title,
        record.user.full_name,
        I18n.l(record.created_at, format: :default),
        link_to(content_tag(:i, '', class: 'fa fa-edit'), edit_references_warehouse_path(record), class: 'btn btn-app-small'),
        link_to(content_tag(:i, '', class: 'fa fa-remove'), references_warehouse_path(record), method: :delete, class: 'btn btn-app-small btn-danger', data: { confirm: "Вы действительно хотите удалить склад?" })  
      ]
    end
  end

  def get_raw_records
    Warehouse.joins(:user).all
  end
end
