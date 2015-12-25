class LinelistsDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Linelists.count,
      iTotalDisplayRecords: linelists.total_entries,
      aaData: data
    }
  end

private

  def data
    linelists.map do |linelist|
      [
        #table output
        h(linelist.id),
        h(linelist.group_number),
        number_to_currency(linelist.day),
        h(linelist.linename) + ' | ' + h(linelist.line_info),
        h(linelist.travel_content ),
        h(linelist.picture_id),
        h(linelist.document_id),
        h(linelist.price),
        link_to(current_user.name, current_user),
        h(linelist.selling_ornot),
        link_to("编辑", edit_linelist(linelist))
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
      linelists = linelists.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
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
    columns = %w[name category released_on price]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end