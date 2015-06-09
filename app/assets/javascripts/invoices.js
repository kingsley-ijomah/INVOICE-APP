$(document).on('keyup mouseup', '.qty-input', function() {
  program($(this));
});


$(document).on('keyup', '.price-input', function() {
  program($(this));
});

$(document).on("click", '.remove-line', function(e) {
  $(this).closest('tr').remove();
  calc_total();
  calc_balance();
});

function program(scope) {
  calc_line_total(scope);
  calc_total();
  calc_balance();
}

function calc_balance() {
  var total = strip_none_int($('#total').text());
  var paid = strip_none_int($('#paid').text());
  $('#balance').text(accounting.formatMoney(total - paid));
}

function strip_none_int(string) {
  return string.replace(/[^\d.]/g, '');
}

function calc_total() {
  var total = 0;
  $('.line-total').each(function(i, line) {
    total += parseFloat(strip_none_int($(line).text()));
    console.log(total);
  }); 

  accounting.settings.currency.symbol = "£";
  $('#total').text(accounting.formatMoney(total));
}

function calc_line_total(scope) {
  var qty = scope.parents('tr').find('.qty-input').val();
  var price = scope.parents('tr').find('.price-input').val();
  var line_total = qty * price;

  accounting.settings.currency.symbol = "£";
  scope.closest('tr').find('.line-total').text(accounting.formatMoney(line_total));
}


