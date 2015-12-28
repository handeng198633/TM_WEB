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
        packageorder.id,
        packageorder.group_number,
        packageorder.outdate.strftime("%y-%m-%d"),
        packageorder.returndate.strftime("%y-%m-%d"),
        packageorder.travel_agency,
        packageorder.person_list,
        packageorder.travel_content,
        packageorder.price1.to_s + ' | ' + packageorder.price2.to_s,
        packageorder.price3.to_s + ' | ' + packageorder.price4.to_s,
        packageorder.out_tracffic_way + ' : ' + packageorder.out_tracffic,
        packageorder.return_tracffic_way + ' : ' + packageorder.return_tracffic,
        packageorder.cost,
        packageorder.package_ornot,
        packageorder.sales,
        link_to('编辑', packageorder) + ' | ' + link_to("删除", packageorder, method: :delete, confirm: "确定删除订单 #{packageorder.id}?" )
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
      packageorders = packageorders.where("id like :search or group_number like :search or outdate like :search or returndate like :search or price1 like :search or price3 like :search or sales like :search", search: "%#{params[:sSearch]}%")
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
    columns = %w[id group_number outdate returndate travel_agency person_list travel_content price1 price3 out_tracffic return_tracffic cost package_ornot sales]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

  def current_user
    if (user_id = session[:user_id])
          @current_user ||= User.find_by(id: user_id)
      elsif (user_id = cookies.signed[:user_id])
          user = User.find_by(id: user_id)
          if user && user.authenticated?(cookies[:remember_token])
            log_in user
            @current_user = user
          end
      end
  end
end

