class CreateDomains < ActiveRecord::Migration[6.0]
  def change
    create_table :domains do |t|
      t.string :post_number,    null: false
      t.integer :prefecture_id, null: false
      t.string :town,           null: false
      t.string :number,         null: false
      t.string :build,          null: false
      t.string :photo_number,   null: false
      t.references :buy, foreign_key: true
      t.timestamps
    end
  end
end
