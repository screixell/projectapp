class CreateLoans < ActiveRecord::Migration[6.0]
  def change
    create_table :loans do |t|
      t.string :disbursed_amount
      t.string :username

      t.timestamps
    end
  end
end
