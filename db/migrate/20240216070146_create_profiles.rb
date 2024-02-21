class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.string :Name
      t.string :User_name
      t.string :Bio
      t.string :Gender
      t.string :DOB
      # t.references :user, null: false, foreign_key: true
      t.belongs_to :user, foreign_key: "user_id" 
      t.timestamps
    end
  end
end
