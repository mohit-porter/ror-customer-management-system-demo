module Services
  module Customer
    class CustomerSignupService
      def initialize
        @use_case = ::Customer::UseCases::CustomerSignupUsecase.new
      end

      def signup(params)
        @use_case.call(params)
      end
    end
  end
end
