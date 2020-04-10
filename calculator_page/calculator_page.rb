require_relative '../page/main_page'

# class CalculatorPage < MainPage
#   URL = 'https://testsheepnz.github.io/BasicCalculator.html'
#
#   def open_website
#     visit URL
#   end
#
#   def title_page(title)
#     expect(page.title).to eq title
#   end
#
#   def first_number(number1)
#     fill_in 'number1Field', with: number1
#     assert_text number1
#   end
#
#   def second_number(number2)
#     fill_in 'number1Field', with: number2
#     assert_text number2
#   end
#
#   def operation
#     math_operation = %w(Add Subtract Multiply Divide Concatenate)
#
#     math_operation.map { |value| value }
#     find 'selectOperationDropdown'.click(value)
#     end
# end

class CalculatorPage < MainPage
  URL = 'https://testsheepnz.github.io/BasicCalculator.html'

  def open_website
    visit URL
  end

  def title_page(title)
    expect(page.title).to eq title
  end

  def result(calculation_result)
    expect(calculation_result).to eq calculation_result
  end

  def first_number(number1)
    fill_in 'number1Field', with: number1
    # assert number1
  end

  def second_number(number2)
    fill_in 'number2Field', with: number2
    # assert_text number2
  end

  def operation()
    math_operation = %w(Add Subtract Multiply Divide Concatenate)

    math_operation.map do |value|
      value
      find 'selectOperationDropdown'.click_on(value)
      yield
    end
  end
end


# math_operation = %w(Add Subtract Multiply Divide Concatenate)
#
# math_operation.map do |value|
#   value
#   find 'selectOperationDropdown'.click_on(value)
#   yield