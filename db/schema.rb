# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180406163836) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.integer "pipefy_id"
    t.string "name"
    t.jsonb "fields", default: []
    t.integer "phase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phase_id", "pipefy_id"], name: "index_cards_on_phase_id_and_pipefy_id"
    t.index ["phase_id"], name: "index_cards_on_phase_id"
    t.index ["pipefy_id"], name: "index_cards_on_pipefy_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.integer "pipefy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pipefy_id"], name: "index_organizations_on_pipefy_id", unique: true
  end

  create_table "phases", force: :cascade do |t|
    t.integer "pipefy_id"
    t.string "name"
    t.jsonb "fields"
    t.integer "pipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pipe_id", "pipefy_id"], name: "index_phases_on_pipe_id_and_pipefy_id"
    t.index ["pipe_id"], name: "index_phases_on_pipe_id"
    t.index ["pipefy_id"], name: "index_phases_on_pipefy_id"
  end

  create_table "pipes", force: :cascade do |t|
    t.integer "pipefy_id"
    t.string "name"
    t.jsonb "start_form_fields", default: []
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id", "pipefy_id"], name: "index_pipes_on_organization_id_and_pipefy_id"
    t.index ["organization_id"], name: "index_pipes_on_organization_id"
    t.index ["pipefy_id"], name: "index_pipes_on_pipefy_id"
  end

end
