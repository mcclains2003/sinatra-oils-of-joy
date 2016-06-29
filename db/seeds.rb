user = User.create(:username => "admin", :password => "admin")

oils_list = {
  "Wintergreen" => { :benefits => ["Minty Aroma", "Stimulating and Invigorating", "Great in a lotion after activity"]
    },
  "Tea Tree" => { :benefits => ["Used in skin care", "Has cleaning properties", "smells great"]
    },
  "Orange" => { :benefits => ["Citrusy Scent", "Stimulates Calming", "Great for linens"]
    },
  "Peppermint" => { :benefits => ["Smells good", "Great for sore muscles", "Good for skin"]
    }
}

oils_list.each do |name, oil_hash|
  o = Oil.new
  o.name = name
  oil_hash.each do |attribute, value|
    o[attribute] = value.join(", ")
  end
  o.save
end

size_cost_list = {
  "8 oz cream" => { :cost => 8},
  "4 oz cream" => { :cost => 4},
  "4 oz oil" => { :cost => 4},
  "8 oz scrub" => { :cost => 6},
  "2 oz lip balm" => { :cost => 3},
  "8 oz spray" => { :cost => 6}
}

size_cost_list.each do |size, cost_hash|
  v = Variant.new
  v.size = size
  cost_hash.each do |attribute, value|
    v[attribute] = value
  end
  v.save
end