include Warden::Test::Helpers

module RspecAuthHelper
  module SessionHelper
    # Rspec uses this to auto log user in in before suite hook
    def login_user
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryGirl.create(:user)
    end
  end

  module WardenHelper
    def login_user
      user = FactoryGirl.create(:user)
      login_as user, scope: :user
    end
  end
end
