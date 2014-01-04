class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :client_id
      t.integer :user_id
      t.text    :remark
      t.string  :status
      t.boolean :is_performed
      t.timestamps
    end
  end
end
