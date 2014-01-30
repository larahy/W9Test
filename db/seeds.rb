# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Story.delete_all
User.delete_all
Vote.delete_all

require 'nokogiri'
require 'open-uri'
page1 = Nokogiri::HTML(open("http://www.vivianmaier.com/gallery/street-5/"))
urls1 = page1.css('.rsImg')
clever = urls1.map {|img| img.attr('src')}
titles1 = page1.css('.rsTitle.rsABlock.rsNoDrag.rsAbsoluteEl').map{|e| e.children.first.text}

# page = Nokogiri::HTML(open("http://surisburnbook.tumblr.com/"))
# titles = page.css('.stat-photo section p')
# clever = titles.map { |thing| thing.text }
# taken = clever.take(9)

# urls = page.css('.stat-photo img').map {|img| img.attr('src')}
# p titles1.inspect
# p clever.inspect

bungle = titles1.zip(clever)

user = User.new
user.email = 'larahy@mailinator.com'
user.password = 'password'
user.password_confirmation = 'password'
user.save!

bungle.each do |title, image_url| 
  Story.create(title: title, url: 'http://www.vivianmaier.com/gallery/street-5/', user_id: user.id, image_url: image_url, price: 100)
end

