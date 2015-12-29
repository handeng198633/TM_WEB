class FinancesDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Finance.count,
      iTotalDisplayRecords: finances.total_entries,
      aaData: data
    }
  end

private

  def data
    finances.map do |finance|
      [
        #table outpu
        finance.id,
        finance.out_date.strftime("%y-%m-%d"),
        finance.package_date.strftime("%y-%m-%d"),
        finance.content,
        finance.travel_agency,
        finance.person_number,
        finance.price4_person,
        finance.should,
        finance.received,
        finance.balance,
        finance.remark,
        link_to('编辑', finance) + ' | ' + link_to("删除", finance, method: :delete, confirm: "确定删除订单 #{finance.id}?" )
      ]
    end
  end

  def finances
    @finances ||= fetch_finances
  end

  def fetch_finances
    finances = Finance.order("#{sort_column} #{sort_direction}")
    finances = finances.page(page).per_page(per_page)
    if params[:sSearch].present?
      finances = finances.where("id like :search or out_date like :search or package_date like :search or content like :search or travel_agency like :search or person_number like :search or price4_person like :search", search: "%#{params[:sSearch]}%")
    end
    finances
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id out_date package_date content travel_agency person_number price4_person should received balance remark]
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

