require 'stringprep/table/base'

module Stringprep
  module Table
    class In < Base
      def initialize(data)
        @code_list = In.parse(data)
      end

      def include?(code)
        if code.is_a?(String)
          unpacked = code.unpack('U*')
          raise ArgumentError, 'Only one character is allowed' unless unpacked.length == 1
          code = unpacked[0]
        end
        return unless code.class < Integer
        @code_list.any? { |x| (x.is_a?(Range)) ? x.include?(code) : x == code }
      end

    private

      # returns an Array
      def self.parse(data)
        data.map { |line|
          if line =~ /([[:xdigit:]]+)-([[:xdigit:]]+)/ 
            $1.to_i(16) .. $2.to_i(16)
          elsif line =~ /([[:xdigit:]]+)/ 
            $1.to_i(16)
          else
            raise "Parse error '#{data}'"
          end
        }
      end
    end
  end
end
