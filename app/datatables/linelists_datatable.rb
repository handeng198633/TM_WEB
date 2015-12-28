class LinelistsDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Linelist.count,
      iTotalDisplayRecords: linelists.total_entries,
      aaData: data
    }
  end

private

  def data
    linelists.map do |linelist|
      [
        #table output
        linelist.id,
        linelist.group_number,
        linelist.day,
        linelist.linename + ' | ' + linelist.line_info,
        linelist.travel_content,
        link_to("下载图片", linelist.picture_url),
        link_to("下载文档", linelist.document_url),
        linelist.price,
        linelist.record_person,
        linelist.selling_ornot,
        link_to("编辑", linelist) + ' | ' + link_to("删除", linelist, method: :delete, confirm: "确定删除线路 #{linelist.id}?" )
      ]
    end
  end

  def linelists
    @linelists ||= fetch_linelists
  end

  def fetch_linelists
    linelists = Linelist.order("#{sort_column} #{sort_direction}")
    linelists = linelists.page(page).per_page(per_page)
    if params[:sSearch].present?
      linelists = linelists.where("id like :search or group_number like :search or day like :search or linename like :search or price like :search or record_person like :search or selling_ornot like :search", search: "%#{params[:sSearch]}%")
    end
    linelists
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id group_number day linename line_info travel_content picture document price record_person selling_ornot]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end