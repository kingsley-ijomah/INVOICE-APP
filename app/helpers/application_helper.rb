module ApplicationHelper
  def precision2f(n)
    unless n.nil?
      "%.2f" % n
    end
  end
end
