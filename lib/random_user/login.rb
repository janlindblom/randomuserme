
class RandomUser
  class Login
    attr_accessor :uuid, :username, :password, :salt, :md5, :sha1, :sha256

    def ==(other)
      return false unless other.is_a?(self.class)
      (self.uuid == other.uuid) && (self.username == other.username) && (self.password == other.password) && (self.md5 == other.md5) && (self.salt == other.salt) && (self.sha1 == other.sha1) && (self.sha256 == other.sha256)
    end

    def eql?(other)
      (self == other)
    end

    def valid?
      !(self.uuid.nil? || self.username.nil? || self.password.nil? || self.md5.nil? || self.salt.nil? || self.sha1.nil? || self.sha256.nil?)
    end

    def validate
      throw StandardError.new unless self.valid?
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
