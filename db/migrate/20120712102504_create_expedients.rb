class CreateExpedients < ActiveRecord::Migration
  def change
    create_table :expedients do |t|
      t.integer :student_id
      t.integer :category_id
      t.text :details
      t.datetime :presentation

      t.timestamps
    end
  end
end
