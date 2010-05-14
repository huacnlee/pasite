# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091127000002) do

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "languages", :force => true do |t|
    t.string   "name",                          :null => false
    t.string   "slug",                          :null => false
    t.integer  "snippets_count", :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "snippets", :force => true do |t|
    t.string   "title",                                :null => false
    t.text     "code",                                 :null => false
    t.text     "code_formatted",                       :null => false
    t.float    "size",              :default => 0.0
    t.integer  "language_id"
    t.boolean  "private",           :default => false, :null => false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "line_count",        :default => 0,     :null => false
    t.text     "summary_formatted",                    :null => false
    t.integer  "comments_count",    :default => 0
    t.string   "desc"
    t.integer  "views_count",       :default => 0,     :null => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "taggable_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                              :null => false
    t.string   "login",                             :null => false
    t.string   "passwd",                            :null => false
    t.string   "email",                             :null => false
    t.integer  "snippets_count", :default => 0,     :null => false
    t.string   "bio"
    t.string   "url"
    t.boolean  "admin",          :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "oauth_token",    :default => "",    :null => false
    t.string   "oauth_secret",   :default => "",    :null => false
    t.integer  "comments_count", :default => 0
  end

end
