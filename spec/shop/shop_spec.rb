require_relative '../../shop_page/shop_page'

describe 'Visit website and buy two items' do
  include ShopPage

  let(:username) { 'standard_user' }
  let(:password) { 'secret_sauce' }

  before do
    visit_shop_page
  end

  context 'Open website' do
    it 'on a main page' do
      visit_shop_page
      expect(page.title).to eq('Swag Labs')
    end


    it 'Log in with valid credentials' do
      user_name_field(username)
      page.has_field?('user-name', with: username)

      password_field(password)
      page.has_field?('password', with: password)

      click_on_submit_button
      page.has_content?('Products')


      expect(page).to have_no_css('.shopping_cart_badge')
      expect(check_add_to_card_button).to eq(0)

      click_on_add_to_card
      expect(check_add_to_card_button).to eq(2)
      expect(check_the_cart).to have_text('2')

      open_cart

      page.has_content?('Sauce Labs Bolt T-Shirt')
      page.has_content?('15.99')

      page.has_content?('Sauce Labs Fleece Jacket')
      page.has_content?('49.99')


      remove_items
      expect(page).to have_no_css('.shopping_cart_badge')
    end
  end
end
