require_relative '../../calculator_page/calculator_page'

# describe 'Calculation on a Basic Calculator page' do
#   let(:calculator_page) { CalculatorPage.new }
#   let(:title) { 'Basic Calculator' }
#   let(:number1) { Faker::Number.within(range: -99..99) }
#   let(:number2) { Faker::Number.within(range: -99..99) }
#
#   before do
#     calculator_page.open_website
#   end
#
#   context 'Open website' do
#     it 'Open page and check the title' do
#       expect(calculator_page.title).to eq title
#     end
#
#     it 'check calculation' do
#       calculator_page.first_number(number1)
#       calculator_page.first_number(number2)
#     end
#
#   end
# end
#

describe 'Calculation on a Basic Calculator page' do
  let(:calculator_page) { CalculatorPage.new }
  let(:title) { 'Basic Calculator' }
  let(:number1) { Faker::Number.within(range: -99..99) }
  let(:number2) { Faker::Number.within(range: -99..99) }

  before do
    calculator_page.open_website
  end

  context 'Open website' do
    it 'Open page and check the title' do
      expect(calculator_page.title).to eq title
    end

    it 'check calculation' do
      calculator_page.first_number(number1)
      calculator_page.second_number(number2)
      [:+, :-, :*, :/].each do |op|
        calculator_page.operation do
          expect(calculator_page.result(calculation_result)).to eq number1.public_send(op, number1)
        end
      end
    end
  end
end