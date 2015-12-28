class NetprofitsDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Netprofit.count,
      iTotalDisplayRecords: netprofits.total_entries,
      aaData: data
    }
  end

private

  def data
    netprofits.map do |netprofit|
      [
        #table outpu
        netprofit.month,
        netprofit.total_income,
        netprofit.total_coat,
        netprofit.profit,
        netprofit.fax,
        netprofit.net_profit,
        netprofit.status,
        link_to('明细', netprofit),
        link_to('编辑', netprofit) + ' | ' + link_to("删除", netprofit, method: :delete, confirm: "确定删除订单 #{netprofit.id}?" )
      ]
    end
  end

  def netprofits
    @netprofits ||= fetch_netprofits
  end

  def fetch_netprofits
    netprofits = Netprofit.order("#{sort_column} #{sort_direction}")
    netprofits = netprofits.page(page).per_page(per_page)
    if params[:sSearch].present?
      netprofits = netprofits.where("month like :search or total_income like :search or total_coat like :search or profit like :search or fax like :search or net_profit like :search", search: "%#{params[:sSearch]}%")
    end
    netprofits
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[month total_income total_coat profit fax net_profit status]
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
