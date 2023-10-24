require 'uri'

class Randomuser
  class Picture
    attr_accessor :large, :medium, :thumbnail

    def self.from_json(json_data)
      p = Picture.new
      p.large = URI(json_data['large'])
      p.medium = URI(json_data['medium'])
      p.thumbnail = URI(json_data['thumbnail'])
      p
    end
  end
end
