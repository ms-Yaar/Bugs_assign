class AddUserRefToProjects < ActiveRecord::Migration[7.1]
  def change
    add_reference :projects, :user, null: false, foreign_key: true
  end
end
