require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature do
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

  scenario 'increases cart count by one when product is added' do

    visit root_path
    footer_link = page.all('.product footer button')[0]
    footer_link.click

    within('nav') { expect(page).to have_content('My Cart (1)') }
  end
end
