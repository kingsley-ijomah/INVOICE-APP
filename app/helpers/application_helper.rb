module ApplicationHelper
  def to_currency(n)
    number_to_currency(n, unit: "£")
  end
end
