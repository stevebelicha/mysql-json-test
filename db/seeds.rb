NUMBER_OF_PARENT_RECORDS = 100_000

NUMBER_OF_PARENT_RECORDS.times do |index|
  parent = TestParentModel.new(name: Faker::Name.title)
  rand(2..4).times do  # each parent could have 2-4 children
    parent.children.build string_field: Faker::Name.name,
      text_field: Faker::Lorem.paragraph(2),
      date_field: Faker::Date.between(2.years.ago, Date.today),
      decimal_field: Faker::Number.number(10),
      bool_field: [ true, false ].shuffle.pop,
      json_field: [
        { a: Faker::Config.locale, b: Faker::Avatar.image, c: Faker::Avatar.image },
        { 1 => Faker::Address.street_address, 2 => nil, 3 => [ true, false ].shuffle.pop },
        nil,
        { field1: Faker::Address.zip_code, field2: Faker::Number.number(4) },
        { 'x': { a: Faker::Lorem.sentence, b: Faker::Date.between(2.years.ago, Date.today) }, 'y': [ true, false ].shuffle.pop }
      ].shuffle.pop  # five different JSON structures
  end
  parent.save!
  puts "Created record ##{index + 1} with #{parent.children.count} children"
end
