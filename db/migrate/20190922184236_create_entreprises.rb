class CreateEntreprises < ActiveRecord::Migration[6.0]
  def change
    create_table :entreprises do |t|
      t.string :nom
      t.string :adresse
      t.integer :code_postal
      t.string :ville
      t.string :pays

      t.timestamps
    end
  end
end
