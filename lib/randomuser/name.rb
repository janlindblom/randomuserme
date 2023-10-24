class Randomuser
  class Name
    attr_accessor :title, :first, :last

    def ==(other)
      (self.title == other.title) && (self.first == other.first) && (self.last == other.last)
    end

    def eql?(other)
      (self == other)
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
