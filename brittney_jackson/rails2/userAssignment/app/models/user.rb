class User < ActiveRecord::Base
  has_secure_password
  has_many :secrets
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secret

  email_regex = /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/

  before_save :downcase

  validates :name, :password, presence: true
  validates :email, 
  	uniqueness: { case_sensitive: false },
  	presence: true,
  	format: { with: email_regex }

  def downcase
  	self.name.downcase!
  	self.email.downcase!
  end

end
