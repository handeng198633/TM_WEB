class PlaneticketsDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Planeticket.count,
      iTotalDisplayRecords: planetickets.total_entries,
      aaData: data
    }
  end

private

  def data
    planetickets.map do |planeticket|
      [
        #table outpu
        planeticket.id,
        planeticket.category,
        planeticket.order_id,
        planeticket.number,
        planeticket.outdate.strftime("%y-%m-%d"),
        planeticket.travel_content,
        planeticket.combined_transport,
        planeticket.ticketdate,
        planeticket.place,
        planeticket.person_name,
        planeticket.person_idcard,
        planeticket.valid_date.strftime("%y-%m-%d"),
        planeticket.born_date.strftime("%y-%m-%d"),
        planeticket.ticket_cost,
        planeticket.counter_cost,
        planeticket.plane,
        planeticket.remark,
        planeticket.record_person,
        planeticket.record_remark,
        planeticket.state,
        planeticket.state_step,
        link_to('编辑', planeticket) + ' | ' + link_to("删除", planeticket, method: :delete, confirm: "确定删除订单 #{planeticket.id}?" )
      ]
    end
  end

  def planetickets
    @planetickets ||= fetch_planetickets
  end

  def fetch_planetickets
    planetickets = Planeticket.order("#{sort_column} #{sort_direction}")
    planetickets = planetickets.page(page).per_page(per_page)
    if params[:sSearch].present?
      planetickets = planetickets.where("id like :search or category like :search or order_id like :search or number like :search or outdate like :search or combined_transport like :search or ticketdate like :search or place like :search or person_name like :search or person_idcard like :search or ticket_cost like :search or plane like :search or record_person like :search", search: "%#{params[:sSearch]}%")
    end
    planetickets
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id category order_id number outdate travel_content combined_transport ticketdate place person_name person_idcard valid_date born_date ticket_cost counter_cost plane remark record_person record_remark state state_step]
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