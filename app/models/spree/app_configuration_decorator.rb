Spree::AppConfiguration.class_eval do
  preference :cash_on_delivery_charge, :decimal, :default => 25.0
end

