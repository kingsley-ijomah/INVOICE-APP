module ButtonStateHelper
  def set_active_if_current(controller:)
    if controller == params[:controller]
      'active'
    end
  end
end
