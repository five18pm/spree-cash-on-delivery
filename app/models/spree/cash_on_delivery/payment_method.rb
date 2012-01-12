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
  
    def actions
      %w{capture void cash_received}
    end

    def can_capture?(payment)
      ['checkout', 'pending'].include?(payment.state)
    end
  
    def can_void?(payment)
      payment.state != 'void'
    end

    def can_cash_received?(payment)
      payment.state == 'complete'
    end

    def capture(payment)
      payment.update_attribute(:state, 'pending') if payment.state == 'checkout'
      payment.complete
      true
    end

    def void(payment)
      payment.update_attribute(:state, 'pending') if payment.state == 'checkout'
      payment.void
      true
    end

    def cash_received(payment)
      payment.source.cash_received
      true
    end
  end
end
