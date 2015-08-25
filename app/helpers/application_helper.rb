module TransactionsHelper
  def add_sign_to_value(value, sign)
    sign ? value : 0 - value
  end
end
