class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :user
      t.string :title

      t.timestamps
    end
    add_index :logs, :user_id
  end
end
