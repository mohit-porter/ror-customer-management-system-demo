# app/modules/customer/entity/customer_record.rb
module Customer
  module Entity
    class CustomerRecord < ApplicationRecord
      self.table_name = 'customers'

      has_secure_password

      validates :name, presence: true
      validates :email, presence: true, uniqueness: true
      validates :password_digest, presence: true
    end
  end
end