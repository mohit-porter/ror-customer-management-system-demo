module Api
  module V1
    class CustomerSignupController < ApplicationController
      def create
        service = ::Services::Customer::CustomerSignupService.new
        result = service.signup(customer_params)

        if result[:success]
          render status: :created
        else
          render json: { errors: result[:errors] }, status: :unprocessable_entity
        end
      end

      private

      def customer_params
        params.require(:customer).permit(:name, :email, :password)
      end
    end
  end
end