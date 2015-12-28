class FitordersDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Fitorder.count,
      iTotalDisplayRecords: fitorders.total_entries,
      aaData: data
    }
  end

  private

    def data
      fitorders.map do |fitorder|
        [
          #table output
          fitorder.id,
          fitorder.group_number,
          fitorder.outdate.strftime("%y-%m-%d"),
          fitorder.returndate.strftime("%y-%m-%d"),
          fitorder.bookinfo,
          fitorder.info,
          fitorder.persons_list,
          fitorder.comeinfo_way + ' : ' + fitorder.comeinfo,
          fitorder.goinfo_way + ' : ' + fitorder.goinfo,
          fitorder.price1.to_s + ' | ' + fitorder.price2.to_s,
          fitorder.price3.to_s + ' | ' + fitorder.price4.to_s,
          fitorder.customers_info,
          fitorder.tip,
          fitorder.recipient,     
          fitorder.current_collction,
          fitorder.status,
          link_to('编辑', fitorder) + ' | ' + link_to("删除", fitorder, method: :delete, confirm: "确定删除订单 #{fitorder.id}?" )
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
        fitorders = fitorders.where("id like :search or group_number like :search or outdate like :search or returndate like :search or bookinfo like :search or info like :search or comeinfo like :search or goinfo like :search or price1 like :search or price3 like :search or recipient like :search", search: "%#{params[:sSearch]}%")
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
      columns = %w[id group_number outdate returndate bookinfo info persons_list comeinfo goinfo price1 price3 customers_info tip recipient current_collction status]
      columns[params[:iSortCol_0].to_i]
    end

    def sort_direction
      params[:sSortDir_0] == "desc" ? "desc" : "asc"
    end
end