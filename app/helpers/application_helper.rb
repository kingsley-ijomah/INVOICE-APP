module ApplicationHelper
	def showValidationErrors(model:)
		if model.errors.full_messages.any?
			render :partial => "shared/validation_errors", :locals => {:messages => model.errors.full_messages}
    end
	end
end
