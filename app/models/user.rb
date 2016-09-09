class User < ActiveRecord::Base
  validates :username, :session_token, :password_digest, presence: true
  validates :username, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  after_initialize :ensure_session_token
  has_many :comments
  has_many :recipes
  has_many :like, dependent: :destroy
  has_many :liked_recipes,
    through: :like,
    source: :recipe
  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def self.find_by_credentials(username, password)
    user = User.includes(:recipes).find_by(username: username)
    return nil unless user
    user.is_password?(password) ? user : nil
  end
end
