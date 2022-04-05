class CreateChatboxes < ActiveRecord::Migration[6.1]
  def change
    create_table :chatboxes do |t|
      t.string :name
      t.boolean :is_private, :default => false

      t.timestamps
    end
  end
end
