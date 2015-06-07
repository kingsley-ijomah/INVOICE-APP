$(document).on('keyup mouseup', '.qty-input', function() {
  calc_line_total($(this));
});


$(document).on('keyup', '.price-input', function() {
  calc_line_total($(this));
});

function calc_line_total(scope) {
  var qty = scope.parents('tr').find('.qty-input').val();
  var price = scope.parents('tr').find('.price-input').val();
  var line_total = qty * price;

  accounting.settings.currency.symbol = "£";
  scope.closest('tr').find('.line-total').text(accounting.formatMoney(line_total));
}
