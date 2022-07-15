class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.integer    :item_type, null: false, default: 0
      t.integer    :time, null: false
      t.boolean    :deleted, null: false, default: false

      t.references :item, null: true, foreign_key: true
      t.string     :by, null: true
      t.string     :title, null: true
      t.string     :url, null: true
      t.integer    :score, null: true
      t.string     :text, null: true

      t.timestamps
    end
  end
end
