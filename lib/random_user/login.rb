# frozen_string_literal: true

class RandomUser
  class Login
    attr_accessor :uuid, :username, :password, :salt, :md5, :sha1, :sha256

    def ==(other)
      return false unless other.is_a?(self.class)

      %w[uuid username password salt md5 sha1 sha256].each do |key|
        return false unless send(key.to_sym) == other.send(key.to_sym)
      end
    end

    def eql?(other)
      (self == other)
    end

    def valid?
      !(uuid.nil? || username.nil? || password.nil? || md5.nil? || salt.nil? || sha1.nil? || sha256.nil?)
    end

    def validate
      throw StandardError.new unless valid?
    end

    def self.from_json(json_data)
      l = Login.new
      %w[uuid username password salt md5 sha1 sha256].each do |key|
        l.send "#{key}=", json_data[key]
      end
      l.validate
      l
    end
  end
end
