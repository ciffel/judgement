module Concerns
  module AdminManagement
    extend ActiveSupport::Concern

    private
    def authenticate_admin!
      authenticate_user!
      redirect_to problems_path unless current_user.admin?
    end
  end
end