class OrderDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :link_to, :h, :content_tag, :edit_documents_order_path, :documents_order_path

  def sortable_columns
    @sortable_columns ||= %w(Order.created_at Order.id Brand.title Model.title Client.last_name Order.job_type Order.completeness)
  end

  def searchable_columns
    @searchable_columns ||= %w(Order.id Client.last_name Client.first_name Model.title)
  end

  private

  def data
    records.map do |record|
      [
        I18n.l(record.created_at, format: :default),  
        record.id,  
        record.model.brand.title,
        record.model.title,
        record.client.name,
        record.type,
        record.completeness,
        [link_to(content_tag(:i, '', class: 'fa fa-eye'), documents_order_path(record), class: 'btn btn-app-small'),
        link_to(content_tag(:i, '', class: 'fa fa-edit'), edit_documents_order_path(record), class: 'btn btn-app-small'),
        link_to(content_tag(:i, '', class: 'fa fa-remove'), documents_order_path(record), method: :delete, class: 'btn btn-app-small btn-danger', data: { confirm: "Вы действительно хотите удалить сотрудника?" })].join
      ]
    end
  end

  def get_raw_records
    Order.includes(:client, :warehouse, model: :brand).all
  end  
end
