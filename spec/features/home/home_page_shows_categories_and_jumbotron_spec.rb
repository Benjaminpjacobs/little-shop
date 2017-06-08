# require 'rails_helper'
#
# RSpec.describe "Any user visits root path" do
#   xit "sees categories and jumbotron" do
#
#     categories = 5.times {create(:category_with_items)}
#
#     visit root_path
#
#     within('.jumbotron') do
#       expect(page.all('img').count).to eq(1)
#     end
#
#     categories.each do |category|
#       page.should have_css('.main-wrapper', text: category.title)
#       page.should have_css('.browse-links', :text => category.title)
#     end
#   end
# end
