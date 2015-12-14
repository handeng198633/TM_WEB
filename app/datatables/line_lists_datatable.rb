class LineListsDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: LineLists.count,
      iTotalDisplayRecords: line_lists.total_entries,
      aaData: data
    }
  end

private

  def data
    line_lists.map do |line_list|
      [
        #table output
        link_to(line_list.name, line_list),
        h(line_list.category),
        h(line_list.released_on.strftime("%B %e, %Y")),
        number_to_currency(line_list.price)
      ]
    end
  end

  def line_lists
    @line_lists ||= fetch_line_lists
  end

  def fetch_line_lists
    line_lists = LineList.order("#{sort_column} #{sort_direction}")
    line_lists = line_lists.page(page).per_page(per_page)
    if params[:sSearch].present?
      line_lists = line_lists.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
    end
    line_lists
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