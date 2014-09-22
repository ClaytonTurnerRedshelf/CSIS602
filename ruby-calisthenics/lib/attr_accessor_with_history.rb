class Class
  def attr_accessor_with_history(attr_name)
    attr_reader attr_name
    attr_reader "#{attr_name}_history"
    class_eval %Q{
      def #{attr_name}=(x)
        @#{attr_name}_history = [] if @#{attr_name}_history.nil?
        @#{attr_name}_history << @#{attr_name}
        @#{attr_name} = x
      end
    }

    class_eval do
      def history(n)
        instance_variable_get("@#{n}_history")
      end
    end
  end
end
