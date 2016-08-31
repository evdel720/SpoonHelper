# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
User.create!(email: 'test', password: 'password', bio: 'test users bio')

Category.delete_all
breakfast = Category.create!(title: 'Breakfast')
beverage = Category.create!(title: 'Beverages')
appetizers = Category.create!(title: 'Appetizers')
soups = Category.create!(title: 'Soups')
salads = Category.create!(title: 'Salads')
main_dish = Category.create!(title: 'Main dishes')
desserts = Category.create!(title: 'Desserts')
breads = Category.create!(title: 'Breads')
holidays = Category.create!(title: 'Holidays')

soup_img = Image.create!(url: 'http://res.cloudinary.com/wkdal720/image/upload/v1472664975/soups_kpykjh.jpg', order: 0)
soup_img.imageable = soups
soup_img.save!

beverage_img = Image.create!(url: 'http://res.cloudinary.com/wkdal720/image/upload/v1472664911/Beverages_hh8jez.jpg', order: 0)
beverage_img.imageable = beverage
beverage_img.save!

appetizer_img = Image.create!(url: 'http://res.cloudinary.com/wkdal720/image/upload/v1472664911/Appetizers_rw1fgb.jpg', order: 0)
appetizer_img.imageable = appetizers
appetizer_img.save!

breakfast_img = Image.create!(url: 'http://res.cloudinary.com/wkdal720/image/upload/v1472664911/breakfast_v5z2ti.jpg', order: 0)
breakfast_img.imageable = breakfast
breakfast_img.save!

bread_img = Image.create!(url: 'http://res.cloudinary.com/wkdal720/image/upload/v1472664911/Breads_wzjf2v.jpg', order: 0)
bread_img.imageable = breads
bread_img.save!

holiday_img = Image.create!(url: 'http://res.cloudinary.com/wkdal720/image/upload/v1472664913/holidayfood_rjftkp.jpg', order: 0)
holiday_img.imageable = holidays
holiday_img.save!

salad_img = Image.create!(url: 'http://res.cloudinary.com/wkdal720/image/upload/v1472664912/Salads_nchpcg.jpg', order: 0)
salad_img.imageable = salads
salad_img.save!

main_dish_img = Image.create!(url: 'http://res.cloudinary.com/wkdal720/image/upload/v1472664912/Maindish_pkxhrw.jpg', order: 0)
main_dish_img.imageable = main_dish
main_dish_img.save!

desserts_img = Image.create!(url: 'http://res.cloudinary.com/wkdal720/image/upload/v1472664911/Desserts_r0fabf.jpg', order: 0)
desserts_img.imageable = desserts
desserts_img.save!
