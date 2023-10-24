class Randomuser
  class Name
    attr_accessor :title, :first, :last

    def self.from_json(json_data)
      n = Name.new
      n.title = json_data['title']
      n.first = json_data['first']
      n.last = json_data['last']
      n
    end
  end
end
