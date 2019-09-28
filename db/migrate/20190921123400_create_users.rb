class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.bigint :uid
      t.string :username
      t.string :status
      t.string :photo
      t.date :date_membre
      
      t.timestamps
    end
  end
end
