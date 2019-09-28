class CreateCampagnes < ActiveRecord::Migration[6.0]
  def change
    create_table :campagnes do |t|
      t.string :titre
      t.date :date_debut
      t.boolean :cumulable
      t.string :type_campagne
      t.string :status
      t.text :brief
      t.string :logo
      t.string :hashtag
      t.string :lien_clickable
      t.references :entreprise, null: false, foreign_key: true
      t.references :responsable, null: false, foreign_key: true

      t.timestamps
    end
  end
end
