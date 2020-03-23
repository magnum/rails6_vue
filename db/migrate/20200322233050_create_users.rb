class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string "firstname"
      t.string "lastname"
      t.boolean "active", default: false
      t.text "notes"
      t.string "address"
      t.string "zipcode"
      t.string "city"
      t.string "state_province"
      t.string "phone"
      t.string "fax"
      t.string "mobile"
      t.string "country", default: "it"
      
      t.timestamps
    end
  end
end
