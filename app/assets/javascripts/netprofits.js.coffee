jQuery ->
  $('#netprofits').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#netprofits').data('source')
