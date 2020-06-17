class User < ApplicationRecord
    before_save :encrypt_password
    after_save :clear_password

    INVITES = ["test0", "test1", "test2", "test3", "dm"]
    
    attr_accessor :password
    validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
    validates :password, :confirmation => true #password_confirmation attr
    validates :invite, :uniqueness => true,  :presence => true, inclusion: { in: INVITES }
    validates_length_of :password, :in => 6..255, :on => :create

    def encrypt_password
        if password.present?
            self.salt = BCrypt::Engine.generate_salt
            self.e_password= BCrypt::Engine.hash_secret(password, salt)
        end
    end

    def clear_password
        self.password = nil
    end

    def self.authenticate(params)

        user = User.find_by_username(params[:username])
  
        if user && user.match_password(params[:password])
          return user
        else
          return false
        end
      end   
      
      def match_password(login_password="")
          e_password == BCrypt::Engine.hash_secret(login_password, salt)
      end

end
