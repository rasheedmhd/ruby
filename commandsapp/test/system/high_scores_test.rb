require "application_system_test_case"

class HighScoresTest < ApplicationSystemTestCase
  setup do
    @high_score = high_scores(:one)
  end

  test "visiting the index" do
    visit high_scores_url
    assert_selector "h1", text: "High scores"
  end

  test "should create high score" do
    visit high_scores_url
    click_on "New high score"

    fill_in "Game", with: @high_score.game
    fill_in "Score", with: @high_score.score
    click_on "Create High score"

    assert_text "High score was successfully created"
    click_on "Back"
  end

  test "should update High score" do
    visit high_score_url(@high_score)
    click_on "Edit this high score", match: :first

    fill_in "Game", with: @high_score.game
    fill_in "Score", with: @high_score.score
    click_on "Update High score"

    assert_text "High score was successfully updated"
    click_on "Back"
  end

  test "should destroy High score" do
    visit high_score_url(@high_score)
    click_on "Destroy this high score", match: :first

    assert_text "High score was successfully destroyed"
  end
end
