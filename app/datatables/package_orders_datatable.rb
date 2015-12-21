class PackageOrdersDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: PackageOrder.count,
      iTotalDisplayRecords: package_orders.total_entries,
      aaData: data
    }
  end

private

  def data
    package_orders.map do |package_order|
      [
        #table outpu
        h(package_order.id),
        h(package_order.group_number),
        h(package_order.outdate.strftime("%y/%m/%d")),
        h(package_order.returndate.strftime("%y/%m/%d")),
        h(package_order.travel_agency),
        h(package_order.person_list),
        h(package_order.travel_content),
        number_to_currency(package_order.price1) + ' | ' + number_to_currency(package_order.price2),
        number_to_currency(package_order.price3) + ' | ' + number_to_currency(package_order.price4),
        h(package_order.out_tracffic),
        h(package_order.return_tracffic),
        number_to_currency(package_order.cost),
        h(package_order.package_ornot),
        link_to(current_user.name, current_user),
        link_to("编辑", edit_package_order(package_order))
      ]
    end
  end

  def package_orders
    @package_orders ||= fetch_package_orders
  end

  def fetch_package_orders
    package_orders = PackageOrder.order("#{sort_column} #{sort_direction}")
    package_orders = package_orders.page(page).per_page(per_page)
    if params[:sSearch].present?
      package_orders = package_orders.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
    end
    package_orders
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

