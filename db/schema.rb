

ActiveRecord::Schema.define(version: 20181009134052) do

  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
  end

end
