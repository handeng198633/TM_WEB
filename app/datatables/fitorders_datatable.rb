class FitordersDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Fitorders.count,
      iTotalDisplayRecords: fitorders.total_entries,
      aaData: data
    }
  end

private

  def data
    fitorders.map do |fitorder|
      [
        #table output
        h(fitorder.id),
        h(fitorder.group_number),
        h(fitorder.outdate.strftime("%y/%m/%d")),
        h(fitorder.returndate.strftime("%y/%m/%d")),
        h(fitorder.bookinfo),
        h(fitorder.info),
        h(fitorder.person_list),
        h(fitorder.comeinfo),
        h(fitorder.goinfo),
        number_to_currency(fitorder.price1) + ' | ' + number_to_currency(fitorder.price2),
        number_to_currency(fitorder.price3) + ' | ' + number_to_currency(fitorder.price4),
        h(fitorder.customers_info),
        h(fitorder.tip),
        link_to(current_user.name, current_user),        
        number_to_currency(fitorder.current_collction),
        h(fitorder.status),
        link_to("编辑", edit_fitorder(fitorder))
      ]
    end
  end

  def fitorders
    @fitorders ||= fetch_fitorders
  end

  def fetch_fitorders
    fitorders = Fitorder.order("#{sort_column} #{sort_direction}")
    fitorders = fitorders.page(page).per_page(per_page)
    if params[:sSearch].present?
      fitorders = fitorders.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
    end
    fitorders
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