class CreateParticipers < ActiveRecord::Migration[6.0]
  def change
    create_table :participers do |t|
      t.integer :like
      t.references :user, null: false, foreign_key: true
      t.references :campagne, null: false, foreign_key: true

      t.timestamps
    end
  end
end
