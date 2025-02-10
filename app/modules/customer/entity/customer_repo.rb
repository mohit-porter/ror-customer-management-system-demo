# app/modules/customer/entity/customer_repo.rb
module Customer
  module Entity
    class CustomerRepo
      def initialize
        @customer_record = ::Customer::Entity::CustomerRecord
      end

      def find_by_email(email)
        @customer_record.find_by(email: email)
      end

      def self.save(customer)
        customer.save
      end

      def authenticate(email, password)
        customer = @customer_record.find_by(email: email)
        customer.authenticate(password)
      end
    end
  end
end
