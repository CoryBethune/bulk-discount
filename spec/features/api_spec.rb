require 'rails_helper'

RSpec.describe 'tests for API service methods' do
  xit 'can display the total number of merged pull requests' do
    visit '/admin'
    expect(page).to have_content("Pull Requests: ")
  end


  it "can display the avatars for all the team members on every page" do
    visit '/admin/invoices'

    expect(page).to have_css("img[src='https://avatars.githubusercontent.com/u/98759023?v=4']")
    expect(page).to have_css("img[src='https://avatars.githubusercontent.com/u/60715457?v=4']")
    expect(page).to have_css("img[src='https://avatars.githubusercontent.com/u/95403666?v=4']")
    expect(page).to have_css("img[src='https://avatars.githubusercontent.com/u/98788282?v=4']")
    expect(page).to have_css("img[src='https://avatars.githubusercontent.com/u/97638081?v=4']")
  end

  it 'can display all contributor usernames' do
    visit '/admin/merchants'
    expect(page).to have_content("devAndrewK")
    expect(page).to have_content("tjhaines-cap")
    expect(page).to have_content("CoryBethune")
    expect(page).to have_content("StephenWilkens")
    expect(page).to have_content("ColinReinhart")
  end

  it "displays the repo name" do
    visit "admin/merchants"

    expect(page).to have_content("Repo: little-esty-shop")

  end

  it "displays each users amount of commits" do
    visit '/'

    expect(page).to have_content("devAndrewK has _ commits")
    expect(page).to have_content("tjhaines-cap has _ commits")
    expect(page).to have_content("CoryBethune has _ commits")
    expect(page).to have_content("StephenWilkens has _ commits")
    expect(page).to have_content("ColinReinhart has _ commits")

  end
end
