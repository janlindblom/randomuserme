# frozen_string_literal: true

class RandomUser
  class Name
    attr_accessor :title, :first, :last

    def ==(other)
      (title == other.title) && (first == other.first) && (last == other.last)
    end

    def eql?(other)
      (self == other)
    end

    def valid?
      !(title.nil? || first.nil? || last.nil?)
    end

    def validate
      throw StandardError.new unless valid?
    end

    def self.from_json(json_data)
      p = Name.new
      p.title = json_data['title']
      p.first = json_data['first']
      p.last = json_data['last']
      p
    end
  end
end
