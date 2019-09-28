class AddColumnToparticiper < ActiveRecord::Migration[6.0]
  def change
  	add_column :participers, :provider, :string
  end
end
