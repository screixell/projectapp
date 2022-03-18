class CreateBorrowers < ActiveRecord::Migration[6.0]
  def change
    create_table :borrowers do |t|
      t.string :password_digest
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :code, :default => "123"
      t.string :email
      t.string :credit
      t.string :status, :default => "Inactive"

      t.timestamps
    end
  end
end
