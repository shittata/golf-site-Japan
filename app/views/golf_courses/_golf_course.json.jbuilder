json.extract! golf_course, :id, :name, :area, :description, :image_url, :official_url, :created_at, :updated_at
json.url golf_course_url(golf_course, format: :json)
