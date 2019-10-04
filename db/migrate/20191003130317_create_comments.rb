class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :blog, foreign_key: true, index: true, null: false, comment: "ブログID"
      t.string :content, index: true, null: false, default: "", comment: "内容"

      t.timestamps
    end
  end
end
