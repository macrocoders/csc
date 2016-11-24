class ClientDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :link_to, :h, :content_tag, :edit_references_client_path, :references_client_path

  def sortable_columns
    @sortable_columns ||= %w(Client.id Client.name Client.phone Client.address Client.legal_status)
  end

  def searchable_columns
    @searchable_columns ||= %w(Client.name Client.phone Client.address)
  end

  private

  def data
    records.map do |record|
      [
        record.id,  
        record.name,
        record.phone,
        record.address,
        record.legal_status_s,
        I18n.l(record.created_at, format: :default),
        link_to(content_tag(:i, '', class: 'fa fa-edit'), edit_references_client_path(record), class: 'btn btn-app-small'),
        link_to(content_tag(:i, '', class: 'fa fa-remove'), references_client_path(record), method: :delete, class: 'btn btn-app-small btn-danger', data: { confirm: "Вы действительно хотите удалить контрагента?" })
      ]
    end
  end

  def get_raw_records
    Client.all
  end  
end
