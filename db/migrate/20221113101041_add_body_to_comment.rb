class AddBodyToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :comment, :string
    add_column :comments, :body, :text
  end
end
