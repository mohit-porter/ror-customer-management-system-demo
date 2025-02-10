# app/modules/customer/use_cases/customer_login_usecase.rb
module Customer
  module UseCases
    class CustomerLoginUsecase
      def initialize
        @repository = ::Customer::Entity::CustomerRepo.new
      end

      def call(params)
        email = params[:email]
        password = params[:password]

        customer = @repository.find_by_email(email)
        if customer && customer.authenticate(password)
          if customer.is_logged_in
            { success: false, errors: ["Customer is already logged in"] }
          else
            customer.update(is_logged_in: true)
            { success: true }
          end
        else
          { success: false, errors: ["Invalid email or password"] }
        end
      end
    end
  end
end