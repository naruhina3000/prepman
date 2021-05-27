# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_27_130329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "cookbook_recipes", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "cookbook_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cookbook_id"], name: "index_cookbook_recipes_on_cookbook_id"
    t.index ["recipe_id"], name: "index_cookbook_recipes_on_recipe_id"
  end

  create_table "cookbooks", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id", null: false
    t.boolean "public"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_cookbooks_on_user_id"
  end

  create_table "cooked_recipes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_cooked_recipes_on_recipe_id"
    t.index ["user_id"], name: "index_cooked_recipes_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_favorites_on_recipe_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "followed_cookbooks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "cookbook_id", null: false
    t.index ["cookbook_id"], name: "index_followed_cookbooks_on_cookbook_id"
    t.index ["user_id"], name: "index_followed_cookbooks_on_user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "planners", force: :cascade do |t|
    t.date "date"
    t.bigint "recipe_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_planners_on_recipe_id"
    t.index ["user_id"], name: "index_planners_on_user_id"
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.float "quantity"
    t.string "unit"
    t.bigint "ingredient_id", null: false
    t.bigint "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id"
    t.index ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"
  end

  create_table "recipe_utensils", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "utensil_id", null: false
    t.bigint "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_recipe_utensils_on_recipe_id"
    t.index ["utensil_id"], name: "index_recipe_utensils_on_utensil_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "portion", default: 1
    t.string "difficulty"
    t.integer "prep_time", default: 0
    t.integer "bake_time", default: 0
    t.integer "resting_time", default: 0
    t.string "diet"
    t.string "dish_type"
    t.string "cuisine"
    t.string "occasion"
    t.integer "calories"
    t.integer "protein"
    t.integer "fat"
    t.integer "carb"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status", default: "draft"
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_reviews_on_recipe_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "shopping_list_ingredients", force: :cascade do |t|
    t.bigint "ingredient_id", null: false
    t.bigint "recipe_id"
    t.bigint "shopping_list_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "quantity"
    t.string "unit"
    t.index ["ingredient_id"], name: "index_shopping_list_ingredients_on_ingredient_id"
    t.index ["recipe_id"], name: "index_shopping_list_ingredients_on_recipe_id"
    t.index ["shopping_list_id"], name: "index_shopping_list_ingredients_on_shopping_list_id"
  end

  create_table "shopping_lists", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_shopping_lists_on_user_id"
  end

  create_table "steps", force: :cascade do |t|
    t.integer "number"
    t.text "description"
    t.bigint "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_steps_on_recipe_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "name"
    t.string "url"
    t.text "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "utensils", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cookbook_recipes", "cookbooks"
  add_foreign_key "cookbook_recipes", "recipes"
  add_foreign_key "cookbooks", "users"
  add_foreign_key "cooked_recipes", "recipes"
  add_foreign_key "cooked_recipes", "users"
  add_foreign_key "favorites", "recipes"
  add_foreign_key "favorites", "users"
  add_foreign_key "followed_cookbooks", "cookbooks"
  add_foreign_key "followed_cookbooks", "users"
  add_foreign_key "planners", "recipes"
  add_foreign_key "planners", "users"
  add_foreign_key "recipe_ingredients", "ingredients"
  add_foreign_key "recipe_ingredients", "recipes"
  add_foreign_key "recipe_utensils", "recipes"
  add_foreign_key "recipe_utensils", "utensils"
  add_foreign_key "recipes", "users"
  add_foreign_key "reviews", "recipes"
  add_foreign_key "reviews", "users"
  add_foreign_key "shopping_list_ingredients", "ingredients"
  add_foreign_key "shopping_list_ingredients", "recipes"
  add_foreign_key "shopping_list_ingredients", "shopping_lists"
  add_foreign_key "shopping_lists", "users"
  add_foreign_key "steps", "recipes"
end
