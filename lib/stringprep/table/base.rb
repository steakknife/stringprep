module Stringprep
  module Table
    class Base
      private_class_method :new
      def self.create_read_only(*args, &block)
        x = new(*args, &block)
        x.freeze
        x
      end
    end
  end
end
