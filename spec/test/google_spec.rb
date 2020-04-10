require_relative '../../page/google_page'

describe 'Google Page' do
  context 'when using search' do
    let(:search_word) { 'ruby' }
    let(:google_page) { GooglePage.new }

    it 'search by keyword' do
      google_page.visit_page
      google_page.fill_search_field(search_word)
      google_page.click_search_button
      expect(google_page.title).to include search_word
    end
  end
end