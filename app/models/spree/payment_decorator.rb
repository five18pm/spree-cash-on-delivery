Spree::Payment.class_eval do
  has_one :adjustment, :as => :source, :dependent => :destroy
  def build_source
    return if source_attributes.nil?

    if payment_method and payment_method.payment_source_class
      self.source = payment_method.payment_source_class.new(source_attributes)
      if self.source.respond_to?(:post_create)
        self.source.post_create(self)
      end
    end
  end

  def update_adjustment(adjustment, src)
    if self.source.respond_to?(:update_adjustment)
      self.source.update_adjustment(adjustment, src)
    end
  end
end

