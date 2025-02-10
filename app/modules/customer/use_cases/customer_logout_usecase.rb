module Customer
  module UseCases
    class CustomerLogoutUsecase
      def initialize
        @repository = ::Customer::Entity::CustomerRepo.new
      end

      def call(email)
        customer = @repository.find_by_email(email)
        if customer
          if customer.is_logged_in
            customer.update(is_logged_in: false)
            { success: true }
          else
            { success: false, errors: ["Customer is not logged in"] }
          end
        else
          { success: false, errors: ["Invalid email"] }
        end
      end
    end
  end
end