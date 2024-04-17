class CreateUserComments < ActiveRecord::Migration[7.1]
  def change
    create_table :user_comments do |t|
      t.references :user, foreign_key: true, null: true
      t.references :post, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
