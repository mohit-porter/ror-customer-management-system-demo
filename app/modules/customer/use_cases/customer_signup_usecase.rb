# app/modules/customer/use_cases/customer_signup_usecase.rb
module Customer
  module UseCases
    class CustomerSignupUsecase
      def initialize
        @repository = ::Customer::Entity::CustomerRepo
        @password_format = ::Config::Constants::PASSWORD_FORMAT
      end

      def call(params)
        name = params[:name]
        email = params[:email]
        password = params[:password]

        errors = []
        errors << "Name can't be blank" if name.nil? || name.strip.empty?
        errors << "Email is invalid" if email.nil? || !(email =~ URI::MailTo::EMAIL_REGEXP)
        errors << "Password must be at least 8 characters long, include one lowercase letter, one uppercase letter, one number, and one special character" if password.nil? || !(password =~ @password_format)

        return { success: false, errors: errors } unless errors.empty?

        customer = ::Customer::Entity::CustomerRecord.new(email: email, password: password, name: name)
        if customer.valid?
          if @repository.save(customer)
            { success: true, customer: customer }
          else
            { success: false, errors: customer.errors.full_messages }
          end
        else
          { success: false, errors: customer.errors.full_messages }
        end
      end
    end
  end
end