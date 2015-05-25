class CreateWallets < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
      t.string :name
      t.integer :wallet_type
      t.float :balance
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
