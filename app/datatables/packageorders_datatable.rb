class PackageordersDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Packageorder.count,
      iTotalDisplayRecords: packageorders.total_entries,
      aaData: data
    }
  end

private

  def data
    packageorders.map do |packageorder|
      [
        #table outpu
        h(packageorder.id),
        h(packageorder.group_number),
        h(packageorder.outdate.strftime("%y/%m/%d")),
        h(packageorder.returndate.strftime("%y/%m/%d")),
        h(packageorder.travel_agency),
        h(packageorder.person_list),
        h(packageorder.travel_content),
        number_to_currency(packageorder.price1) + ' | ' + number_to_currency(packageorder.price2),
        number_to_currency(packageorder.price3) + ' | ' + number_to_currency(packageorder.price4),
        h(packageorder.out_tracffic),
        h(packageorder.return_tracffic),
        number_to_currency(packageorder.cost),
        h(packageorder.package_ornot),
        link_to(current_user.name, current_user),
        link_to("编辑", edit_packageorder(packageorder))
      ]
    end
  end

  def packageorders
    @packageorders ||= fetch_packageorders
  end

  def fetch_packageorders
    packageorders = Packageorder.order("#{sort_column} #{sort_direction}")
    packageorders = packageorders.page(page).per_page(per_page)
    if params[:sSearch].present?
      packageorders = packageorders.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
    end
    packageorders
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

