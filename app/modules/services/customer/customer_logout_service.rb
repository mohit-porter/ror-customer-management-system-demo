# app/services/customer/customer_logout_service.rb
module Services
  module Customer
    class CustomerLogoutService
      def initialize
        @use_case = ::Customer::UseCases::CustomerLogoutUsecase.new
      end

      def logout(email)
        @use_case.call(email)
      end
    end
  end
end