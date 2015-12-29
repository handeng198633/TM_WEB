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
        trainticket.category,
        trainticket.order_id,
        trainticket.number,
        trainticket.outdate.strftime("%y-%m-%d"),
        trainticket.travel_content,
        trainticket.combined_transport,
        trainticket.place,
        trainticket.person_name,
        trainticket.person_idcard,
        trainticket.ticket_cost,
        trainticket.difficulty,
        trainticket.seat1,
        trainticket.seat2,
        trainticket.remark,
        trainticket.record_person,
        trainticket.record_remark,
        trainticket.state,
        trainticket.state_step,
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
      traintickets = traintickets.where("id like :search or category like :search or order_id like :search or number like :search or outdate like :search or combined_transport like :search or place like :search or person_name  like :search or person_idcard like :search or ticket_cost like :search or difficulty like :search or record_person like :search", search: "%#{params[:sSearch]}%")
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
    columns = %w[id category order_id number outdate travel_content combined_transport place person_name person_idcard ticket_cost difficulty seat1 seat2 remark record_person record_remark state state_step]
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