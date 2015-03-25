Fabricator(:location) do
	lat {Faker::Address.latitude}
	lng {Faker::Address.longitude}
end

Fabricator(:location_in_boonton, from: :location) do
	lat 40.895929
	lng -74.409714
end

Fabricator(:location_around_boonton, from: :location) do
	lat {(rand*rand*0.075 -0.0375) + 40.895929}
	lng {(rand*rand*0.075 -0.0375) -74.409714}
end

Fabricator(:trap) do
	name {"Test Trap " + Faker::Number.number(3).to_s}
	hardware_id {Faker::Code.isbn}
	after_create { |attrs| Fabricate(:location_around_boonton, locationable_id: attrs[:id], locationable_type: "Trap" )}
end