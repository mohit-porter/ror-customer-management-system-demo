module Api
  module V1
    class CustomerSessionsController < ApplicationController
      def create
        service = ::Services::Customer::CustomerLoginService.new
        result = service.login(session_params)

        if result[:success]
          render status: :ok
        else
          render json: { errors: result[:errors] }, status: :unauthorized
        end
      end

      def destroy
        service = ::Services::Customer::CustomerLogoutService.new
        result = service.logout(session_params[:email])

        if result[:success]
          render status: :ok
        else
          render json: { errors: result[:errors] }, status: :unprocessable_entity
        end
      end

      private

      def session_params
        params.require(:customer).permit(:email, :password)
      end
    end
  end
end