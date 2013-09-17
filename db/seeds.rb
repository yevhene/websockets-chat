# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |i|
  Message.create(
    name: 'Грегори Пупс',
    text: 'Журналисты не могли не отметить пророческий характер картины: московская премьера практически совпала с приведением Северной Кореей в боевую готовность ракетных войск для нанесения удара.'
  )
end
