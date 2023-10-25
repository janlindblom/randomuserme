class Randomuser
  class Name
    attr_accessor :title, :first, :last

    def ==(other)
      (self.title == other.title) && (self.first == other.first) && (self.last == other.last)
    end

    def eql?(other)
      (self == other)
    end

    def valid?
      !(self.title.nil? || self.first.nil? || self.last.nil?)
    end

    def validate
      throw StandardError.new unless self.valid?
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
