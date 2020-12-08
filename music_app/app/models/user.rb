class User < ApplicationRecord
    # figVaper  
    validates :email, uniqueness: {case_sensitive: true}
    validates :session_token, presence: true
    validates :password_digest, presence: true
    validates :password, minimum: {length: 6}, allow_nil: true

    attr_reader :password 
    after_initialize :ensure_session_token

    def self.find_by_credentials(email, password_input)
        user = User.find_by(email: email)
        return user if user && user.is_password?(password)
    end

    def is_password?(input_password)
        BCrypt::Password.new(self.password_digest).is_password?(input_password)
    end

    def password=(input_password)
        @password_digest = input_password
        self.password_digest = BCrypt::Password.create(input_password)
    end

    def reset_session_token
        # self.update!(session_token: User.generate_session_token)

        self.session_token = User.generate_session_token
        self.session_token
    end

    private

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end
end
