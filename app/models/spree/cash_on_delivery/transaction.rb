require File.expand_path(File.join(File.dirname(__FILE__), '..', 'cash_on_delivery.rb'))

module Spree
  module CashOnDelivery
    class Transaction < ActiveRecord::Base
      has_many :payments, :as => :source

      state_machine :initial => 'goods_sent' do
        event :cash_received do
          transition 'goods_sent' => 'cash_received'
        end
  
        event :void do
          transition 'goods_sent' => 'canceled'
        end
      end
    end
  end
end
