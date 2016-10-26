module WebmachineHALJSONAPIDemo
  class CategoriesResource < BaseResource
    def allowed_methods
      ['GET']
    end

    def resource_exists?
      # @user
      true
    end
  end
end
