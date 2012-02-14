module Spree
  class CashOnDelivery::PaymentMethod < Spree::PaymentMethod
    def payment_profiles_supported?
      true # we want to show the confirm step.
    end

    def provider_class
      self.class
    end
  
    def payment_source_class
      Spree::CashOnDelivery::Transaction
    end
  
    def method_type
      'cash_on_delivery'
    end
  end
end
