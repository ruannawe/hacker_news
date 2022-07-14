class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :by, null: false
      t.references :item, null: true, foreign_key: true
      t.integer    :score, null: false
      t.integer    :time, null: false
      t.string     :title, null: false
      t.integer    :type, null: false, default: 0
      t.string     :url, null: false

      t.timestamps
    end
  end
end
