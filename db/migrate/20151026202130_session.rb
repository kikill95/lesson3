class Session < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :api_key

      t.timestamps null: false
    end
  end
end
