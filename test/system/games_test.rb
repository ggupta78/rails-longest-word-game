require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "visiting the new page should give us 10 div[name='letter'] tags" do
    visit new_url

    # assert test: false
    assert_selector "div[name='letter']", count: 10
  end

  test "submitting the form with a random word should give invalid word message" do
    visit new_url

    fill_in('word', with: 'xyz1')
    click_on('Check')

    assert text: 'Sorry'
  end

  test "submitting the form with valid letters should give 'Apologies' message" do
    visit new_url

    letters = find('input', id: 'letters', visible: :hidden).value
    word_with_valid_letters = letters[0] + letters[2] + letters[4]
    fill_in('word', with: word_with_valid_letters)
    click_on('Check')

    assert text: 'Apologies'
  end


end
