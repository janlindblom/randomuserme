# frozen_string_literal: true

class RandomUser
  class Location
    class Street
      attr_accessor :number, :name

      def ==(other)
        return false unless other.is_a?(self.class)

        (number == other.number) && (name == other.name)
      end

      def eql?(other)
        (self == other)
      end

      def valid?
        !(number.nil? || name.nil?)
      end

      def validate
        throw StandardError.new unless valid?
      end

      def self.from_json(json_data)
        s = Street.new
        s.number = json_data['number']
        s.name = json_data['name']
        s.validate
        s
      end
    end
  end
end