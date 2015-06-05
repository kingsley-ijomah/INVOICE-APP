class ItemsController < ApplicationController
	def new
		@item = Item.new
	end

  def destroy
  end
end
