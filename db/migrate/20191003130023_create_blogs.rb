class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :content, index: true, null: false, default: "", comment: "内容"
      t.string :title, index: true, null: false, default: "", comment: "タイトル"

      t.timestamps
    end
  end
end
