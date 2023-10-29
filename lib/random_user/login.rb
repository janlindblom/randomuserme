# frozen_string_literal: true

class RandomUser
  class Login
    attr_accessor :uuid, :username, :password, :salt, :md5, :sha1, :sha256

    def ==(other)
      return false unless other.is_a?(self.class)

      (uuid == other.uuid) && (username == other.username) && (password == other.password) && (md5 == other.md5) && (salt == other.salt) && (sha1 == other.sha1) && (sha256 == other.sha256)
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
      l.uuid = json_data['uuid']
      l.username = json_data['username']
      l.password = json_data['password']
      l.md5 = json_data['md5']
      l.salt = json_data['salt']
      l.sha1 = json_data['sha1']
      l.sha256 = json_data['sha256']
      l.validate
      l
    end
  end
end
