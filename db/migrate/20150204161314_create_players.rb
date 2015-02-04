class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.integer :school_id, null: false
      t.string :gender, null: false
      t.integer :rank, null: false

      t.timestamps
    end

    add_index :players, :school_id
  end
end
