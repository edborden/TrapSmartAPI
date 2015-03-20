ActiveRecord::Schema.define do

	# These are extensions that must be enabled in order to support this database
	enable_extension "plpgsql"

	create_table "users", force: true do |t|
		t.string   "email"
		t.string "password_digest"
		t.string   "name"
		t.datetime "created_at"
		t.integer "company_id"
		t.boolean "admin"
	end

	create_table "sessions", force: true do |t|
		t.string   "token"
		t.integer "user_id"
	end

	create_table "companies", force: true do |t|
		t.string   "name"
		t.string "address"
		t.string "locality"
		t.string "region"
		t.string "postcode"
		t.string "country", default: "US"
		t.datetime "created_at"
	end

	create_table "traps", force: true do |t|
		t.string   "name"
		t.datetime "created_at"
	end	

	create_table "locations", force: true do |t|
		t.decimal  "lat",        precision: 8, scale: 6, null: false
		t.decimal  "lng",        precision: 9, scale: 6, null: false
		t.datetime "updated_at"
	end		

end