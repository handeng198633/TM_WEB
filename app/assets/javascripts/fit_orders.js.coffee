jQuery ->
  $('#fit_orders').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#fit_orders').data('source')