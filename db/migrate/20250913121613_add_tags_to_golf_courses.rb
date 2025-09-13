class AddTagsToGolfCourses < ActiveRecord::Migration[7.2]
  def change
    add_column :golf_courses, :tags, :string
  end
end
