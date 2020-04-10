require_relative '../page/main_page'

module ShopPage
  URL = 'https://www.saucedemo.com/index.html'

  def visit_shop_page
    visit URL
  end

  def user_name_field(username)
    fill_in 'user-name', with: username
  end

  def password_field(password)
    fill_in 'password', with: password
  end

  def click_on_submit_button
    click_button('LOGIN')
  end

  def click_on_add_to_card
    find_all('.btn_inventory')[2].click
    find_all('.btn_inventory')[3].click
  end

  def check_add_to_card_button
    find_all('.btn_secondary').size
  end

  def check_the_cart
    find('.shopping_cart_badge').text
  end

  def open_cart
    find('.shopping_cart_link').click
  end

  def remove_items
    find_all('.btn_secondary')[1].click
    find_all('.btn_secondary')[0].click
  end
end