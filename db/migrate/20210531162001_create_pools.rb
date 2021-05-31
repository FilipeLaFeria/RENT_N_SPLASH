class CreatePools < ActiveRecord::Migration[6.0]
  def change
    create_table :pools do |t|
      t.string :title
      t.string :address
      t.string :size
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
