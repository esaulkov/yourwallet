class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.float :sum
      t.datetime :date_time
      t.belongs_to :wallet, index: true, foreign_key: true
      t.belongs_to :purchase, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
