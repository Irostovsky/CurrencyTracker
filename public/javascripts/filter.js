$(document).ready(function() {
  var theTable = $('table.items');
  
  $("#filter").keyup(function() {
      $.uiTableFilter( theTable, this.value, "Name");
  });
  
  // $('.simple_pie_chart').livequery(function(){
  //   SimplePieChart.initialize(this);
  // })
  
})