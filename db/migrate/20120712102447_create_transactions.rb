class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :expedient_id
      t.integer :office_id
      t.integer :user_id
      t.integer :state
      t.text :comment

      t.timestamps
    end
  end
end
