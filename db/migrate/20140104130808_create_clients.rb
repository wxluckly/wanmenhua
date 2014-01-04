class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string  :name
      t.string  :gender
      t.integer :age
      t.text    :exam_info
      t.string  :cellphone
      t.string  :address
      t.string  :email
      t.timestamps
    end
  end
end
