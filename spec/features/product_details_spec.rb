require 'rails_helper'

RSpec.feature 'ProductDetails', type: :feature do
  before :each do
    @category = Category.create! name: 'Apparel'
    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario 'visits product details page when product is clicked on home page' do
    visit root_path
    header_link = page.all('.product header a')[0]
    header_link.click
    expect(page).to have_css '.products-show'

    visit root_path
    footer_link = page.all('.product footer a')[0]
    footer_link.click
    expect(page).to have_css '.products-show'
  end
  
end