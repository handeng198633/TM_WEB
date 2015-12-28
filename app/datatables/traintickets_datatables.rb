class TrainticketsDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Trainticket.count,
      iTotalDisplayRecords: traintickets.total_entries,
      aaData: data
    }
  end

private

  def data
    traintickets.map do |trainticket|
      [
        #table outpu
        trainticket.id,
        trainticket.group_number,
        trainticket.outdate("%y-%m-%d"),
        trainticket.returndate("%y-%m-%d"),
        trainticket.travel_agency,
        trainticket.person_list,
        trainticket.travel_content,
        trainticket.price1.to_s + ' | ' + trainticket.price2.to_s,
        trainticket.price3.to_s + ' | ' + trainticket.price4.to_s,
        trainticket.out_tracffic_way + ' : ' + trainticket.out_tracffic,
        trainticket.return_tracffic_way + ' : ' + trainticket.return_tracffic,
        trainticket.cost,
        trainticket.package_ornot,
        trainticket.sales,
        link_to('编辑', trainticket) + ' | ' + link_to("删除", trainticket, method: :delete, confirm: "确定删除订单 #{trainticket.id}?" )
      ]
    end
  end

  def traintickets
    @traintickets ||= fetch_traintickets
  end

  def fetch_traintickets
    traintickets = Trainticket.order("#{sort_column} #{sort_direction}")
    traintickets = traintickets.page(page).per_page(per_page)
    if params[:sSearch].present?
      traintickets = traintickets.where("id like :search or group_number like :search or outdate like :search or returndate like :search or price1 like :search or price3 like :search or sales like :search", search: "%#{params[:sSearch]}%")
    end
    traintickets
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