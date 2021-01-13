class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer    :postal_code,    null: false
      t.integer    :prefecture_id,  null: false
      t.integer    :city,           null: false
      t.integer    :house_num,      null: false
      t.integer    :building    
      t.integer    :phone_num,      null: false
      t.references :buy,            null: false, foreign_key: true

      t.timestamps
    end
  end
end
