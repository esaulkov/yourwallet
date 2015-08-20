class AddSideToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :side, :integer
    add_column :transactions, :inner, :integer
  end
end
