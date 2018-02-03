module ApplicationType
  extend ActiveSupport::Concern

  module ClassMethods
    delegate :model_name, to: :superclass

    delegate :name, to: :superclass

    def permit(*args)
      @_args = args
    end

    def _args
      @_args
    end
  end

  def assign_attributes(attrs = {}, _options = {})
    raise ArgumentError, 'expected hash' if attrs.nil?
    if attrs.respond_to? :permit
      permitted_attrs = attrs.send :permit, self.class._args
      super(permitted_attrs)
    else
      super(attrs)
    end
  end
end
