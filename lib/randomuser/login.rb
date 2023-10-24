
class Randomuser
  class Login
    attr_accessor :uuid, :username, :password, :salt, :md5, :sha1, :sha256

    def self.from_json(json_data)
      l = Login.new
      l.uuid = json_data['uuid']
      l.username = json_data['username']
      l.password = json_data['password']
      l.md5 = json_data['md5']
      l.salt = json_data['salt']
      l.sha1 = json_data['sha1']
      l.sha256 = json_data['sha256']
      l
    end

    def valid?
      !(self.uuid.nil? || self.username.nil? || self.password.nil? || self.md5.nil? || self.salt.nil? || self.sha1.nil? || self.sha256.nil?)
    end

    def validate
      throw StandardError.new unless self.valid?
    end
  end
end
