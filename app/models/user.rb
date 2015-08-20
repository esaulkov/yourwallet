class User < ActiveRecord::Base
  has_many :wallets, inverse_of: :user, dependent: :destroy
  has_many :transactions, through: :wallets
  has_many :categories, inverse_of: :user, dependent: :destroy
  has_many :purchases, through: :categories
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_length_of :name, maximum: 50

  before_save { email.downcase! }

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  
  validates_uniqueness_of :password
  validates_presence_of :password, if: :password_required?
  validates_confirmation_of :password, if: :password_required?
  validates_length_of :password, within: password_length, allow_blank: true
  
  validates_numericality_of :limit, allow_nil: true
  
  def account_sum
    wallets.to_a.sum(&:balance)
  end

  def get_last_transactions
    transactions.order(date_time: :desc).limit(5)
  end

  def get_this_month_transactions
    transactions.where(date_time: Time.now.at_beginning_of_month..Time.now)
  end

  def has_overdraft?
    return false if limit.blank?
    this_month = get_this_month_transactions.to_a.sum(&:sum)
    this_month > limit
  end

  protected

  # Passwords are always required if it's a new record, or if the password
  # or confirmation are being set somewhere.
  # From Devise gem
  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end

end
