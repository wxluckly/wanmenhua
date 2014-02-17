class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.string  :title
      t.text    :content
      t.string  :image
      t.timestamps
    end
  end
end
