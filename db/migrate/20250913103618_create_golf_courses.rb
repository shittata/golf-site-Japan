class CreateGolfCourses < ActiveRecord::Migration[7.2]
  def change
    create_table :golf_courses do |t|
      t.string :name
      t.string :area
      t.text :description
      t.string :image_url
      t.string :official_url

      t.timestamps
    end
  end
end
