module BreadCrumHelper
  def bread_crums_origin
    'Dashboard'
  end

  def bread_crums_controller
    params[:controller].capitalize
  end

  def bread_crums_method
    params[:action].capitalize
  end

  def build_bread_crums
    if bread_crums_origin == bread_crums_controller
      [bread_crums_controller, bread_crums_method]
    else
      [bread_crums_origin, bread_crums_controller, bread_crums_method]
    end
  end
end
