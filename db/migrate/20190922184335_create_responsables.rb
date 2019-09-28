class CreateResponsables < ActiveRecord::Migration[6.0]
  def change
    create_table :responsables do |t|
      t.string :nom
      t.integer :telephone
      t.string :mail

      t.timestamps
    end
  end
end
