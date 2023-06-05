# class CreateMessages < ActiveRecord::Migration[6.1]
#   def change
#     remove_foreign_key :messages, :sender_id

#     create_table :messages do |t|
#       t.text :content
#       t.references :sender, foreign_key: { to_table: :users }
#       t.references :receiver, foreign_key: { to_table: :users }
#       t.references :productable, polymorphic: true, null: false

#       t.timestamps

#       t.foreign_key :users, column: :sender_id
#     end

#   end
# end
