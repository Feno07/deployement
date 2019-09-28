class CreateAdminMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_messages do |t|
      t.references :admin, foreign_key: true
      t.references :user, foreign_key: true
      t.text :content
      t.datetime :date
      t.string :status
      t.timestamps
    end
  end
end
