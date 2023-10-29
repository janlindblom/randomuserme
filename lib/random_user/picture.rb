# frozen_string_literal: true

require 'uri'

class RandomUser
  # A picture object for a RandomUser object.
  class Picture
    attr_accessor :large, :medium, :thumbnail

    def ==(other)
      (large == other.large) && (medium == other.medium) && (thumbnail == other.thumbnail)
    end

    def eql?(other)
      (self == other)
    end

    def valid?
      !(large.nil? || medium.nil? || thumbnail.nil?)
    end

    def validate
      throw StandardError.new unless valid?
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
