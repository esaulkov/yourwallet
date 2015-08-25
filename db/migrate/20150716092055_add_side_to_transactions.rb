class AddSideToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :side, :boolean, default: false
    add_column :transactions, :inner, :integer
  end
end
