class SalescountsDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Salescounts.count,
      iTotalDisplayRecords: salescounts.total_entries,
      aaData: data
    }
  end

private

  def data
    salescounts.map do |salescount|
      [
        #table outpu
        salescount.name,
        salescount.amount,
        salescount.person_number,
        salescount.profit,
        salescount.received,
        salescount.noreceived,
        link_to('编辑', salescount) + ' | ' + link_to("删除", salescount, method: :delete, confirm: "确定删除订单 #{salescount.id}?" )
      ]
    end
  end

  def salescounts
    @salescounts ||= fetch_salescounts
  end

  def fetch_salescounts
    salescounts = Salescounts.order("#{sort_column} #{sort_direction}")
    salescounts = salescounts.page(page).per_page(per_page)
    if params[:sSearch].present?
      salescounts = salescounts.where("id like :search or group_number like :search or outdate like :search or returndate like :search or price1 like :search or price3 like :search or sales like :search", search: "%#{params[:sSearch]}%")
    end
    salescounts
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name amount person_number profit received noreceived]
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