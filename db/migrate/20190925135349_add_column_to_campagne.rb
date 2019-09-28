class AddColumnToCampagne < ActiveRecord::Migration[6.0]
  def change
  	add_column :campagnes, :image_post_url, :string
  end
end
