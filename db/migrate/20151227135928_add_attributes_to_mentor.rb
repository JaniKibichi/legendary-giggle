class AddAttributesToMentor < ActiveRecord::Migration
  def change
    add_column :mentors, :title, :string
    add_column :mentors, :description, :text
    add_column :mentors, :blog, :string
    add_column :mentors, :facebook, :string
    add_column :mentors, :twitter, :string
    add_column :mentors, :linkedin, :string
  end
end
