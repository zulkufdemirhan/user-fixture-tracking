class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :job
      t.string :email
      t.integer :phone
      t.boolean :status
      t.date :entry_date
      t.date :leave_date

      t.timestamps
    end
  end
end
