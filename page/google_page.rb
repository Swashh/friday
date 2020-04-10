require_relative 'main_page'

class GooglePage < MainPage
  GOOGLE_URL = 'https:www.google.com'

  def visit_page
    visit GOOGLE_URL
  end

  def fill_search_field(search_word)
    fill_in(name: 'q', with: search_word)
  end

  def click_search_button
    click_on('btnK')
  end

  def title
    page.title
  end

end