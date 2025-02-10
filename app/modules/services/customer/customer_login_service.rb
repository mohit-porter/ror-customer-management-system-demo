# app/services/customer/customer_login_service.rb
module Services
  module Customer
    class CustomerLoginService
      def initialize
        @use_case = ::Customer::UseCases::CustomerLoginUsecase.new
      end

      def login(params)
        @use_case.call(params)
      end
    end
  end
end