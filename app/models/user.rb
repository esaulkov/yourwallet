class User < ActiveRecord::Base
  has_many :wallets, dependent: :destroy
  has_many :categories, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_length_of :name, maximum: 50

  before_save { email.downcase! }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  
  validates_uniqueness_of :password
  validates_presence_of :password, if: :password_required?
  validates_confirmation_of :password, if: :password_required?
  validates_length_of :password, within: password_length, allow_blank: true
  
  validates_numericality_of :limit, allow_nil: true
  
  def account_sum
    wallets.to_a.sum(&:balance)
  end

  def get_last_transactions
    @wallet_ids = wallets.to_a(&:id)
    Transaction.joins(:wallet, :purchase).select('transactions.*, wallets.name as wallet_name, purchases.name as purchase_name').where(wallet_id: @wallet_ids).order(date_time: :desc).limit(5)
  end

  def get_this_month_transactions
    @wallet_ids = wallets.to_a(&:id)
    Transaction.select('distinct transactions.sum').where(wallet_id: @wallet_ids, date_time: Time.now.at_beginning_of_month..Time.now)
  end

  def get_purchases
    @category_ids = categories.to_a(&:id)
    Purchase.select('purchases.*').where(category_id: @category_ids)
  end

  protected

  # Passwords are always required if it's a new record, or if the password
  # or confirmation are being set somewhere.
  # From Devise gem
  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end

end
