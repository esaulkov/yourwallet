class User < ActiveRecord::Base
  has_many :wallets
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_length_of :name, maximum: 50
  
  before_save { email.downcase!}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  
  validates_uniqueness_of :password
  validates_presence_of :password, if: :password_required?
  validates_confirmation_of :password, if: :password_required?
  validates_length_of :password, within: password_length, allow_blank: true
  
  validates_numericality_of :limit, allow_nil: true
  
  protected
  # Passwords are always required if it's a new record, or if the password
  # or confirmation are being set somewhere.
  # From Devise gem
  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end  
  
end
