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

ActiveRecord::Schema.define(version: 2019_09_27_122855) do

  create_table "admin_messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "admin_id"
    t.bigint "user_id"
    t.text "content"
    t.datetime "date"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_admin_messages_on_admin_id"
    t.index ["user_id"], name: "index_admin_messages_on_user_id"
  end

  create_table "admins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "campagnes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "titre"
    t.date "date_debut"
    t.boolean "cumulable"
    t.string "type_campagne"
    t.string "status"
    t.text "brief"
    t.string "logo"
    t.string "hashtag"
    t.string "lien_clickable"
    t.bigint "entreprise_id", null: false
    t.bigint "responsable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_post_url"
    t.index ["entreprise_id"], name: "index_campagnes_on_entreprise_id"
    t.index ["responsable_id"], name: "index_campagnes_on_responsable_id"
  end

  create_table "entreprises", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "nom"
    t.string "adresse"
    t.integer "code_postal"
    t.string "ville"
    t.string "pays"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.bigint "campagne_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campagne_id"], name: "index_images_on_campagne_id"
  end

  create_table "participers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "like"
    t.bigint "user_id", null: false
    t.bigint "campagne_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.index ["campagne_id"], name: "index_participers_on_campagne_id"
    t.index ["user_id"], name: "index_participers_on_user_id"
  end

  create_table "responsables", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "nom"
    t.integer "telephone"
    t.string "mail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "admin_id"
    t.bigint "user_id"
    t.text "content"
    t.datetime "date"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_user_messages_on_admin_id"
    t.index ["user_id"], name: "index_user_messages_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "uid"
    t.string "username"
    t.string "status"
    t.string "photo"
    t.date "date_membre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "email"
    t.string "user_token"
  end

  add_foreign_key "admin_messages", "admins"
  add_foreign_key "admin_messages", "users"
  add_foreign_key "campagnes", "entreprises"
  add_foreign_key "campagnes", "responsables"
  add_foreign_key "images", "campagnes"
  add_foreign_key "participers", "campagnes"
  add_foreign_key "participers", "users"
  add_foreign_key "user_messages", "admins"
  add_foreign_key "user_messages", "users"
end
