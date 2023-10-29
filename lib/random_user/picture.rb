require 'uri'

class RandomUser
  # A picture object for a RandomUser object.
  class Picture
    attr_accessor :large, :medium, :thumbnail

    def ==(other)
      (self.large == other.large) && (self.medium == other.medium) && (self.thumbnail == other.thumbnail)
    end

    def eql?(other)
      (self == other)
    end

    def valid?
      !(self.large.nil? || self.medium.nil? || self.thumbnail.nil?)
    end

    def validate
      throw StandardError.new unless self.valid?
    end

    def self.from_json(json_data)
      p = Picture.new
      p.large = URI(json_data['large'])
      p.medium = URI(json_data['medium'])
      p.thumbnail = URI(json_data['thumbnail'])
      p.validate
      p
    end
  end
end
