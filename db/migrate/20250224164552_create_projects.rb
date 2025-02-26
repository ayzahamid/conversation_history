# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description
      t.string :code, null: false
      t.integer :status, default: 0
      t.references :creator, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :projects, :code, unique: true
  end
end
