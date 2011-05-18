$(document).ready(function() {
  var theTable = $('table.items');
  
  $("#filter").keyup(function() {
      $.uiTableFilter( theTable, this.value, "Name");
  });
  
})

var checkAllItems = function(){
  $("table.items tr:visible input").attr('checked', true);
};
