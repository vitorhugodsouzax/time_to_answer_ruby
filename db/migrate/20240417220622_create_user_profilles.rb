class CreateUserProfilles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profilles do |t|
      t.string :address
      t.string :gender
      t.date :birthdate
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
