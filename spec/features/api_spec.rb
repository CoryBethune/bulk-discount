require 'rails_helper'

RSpec.describe 'tests for API service methods' do
  xit 'can display the total number of merged pull requests' do
    visit '/admin'
    expect(page).to have_content("Pull Requests: ")
  end


  xit "can display the avatars for all the team members on every page" do
    visit '/admin/invoices'

    expect(page).to have_css("img[src='https://avatars.githubusercontent.com/u/98759023?v=4']")
    expect(page).to have_css("img[src='https://avatars.githubusercontent.com/u/60715457?v=4']")
    expect(page).to have_css("img[src='https://avatars.githubusercontent.com/u/95403666?v=4']")
    expect(page).to have_css("img[src='https://avatars.githubusercontent.com/u/98788282?v=4']")
    expect(page).to have_css("img[src='https://avatars.githubusercontent.com/u/97638081?v=4']")
  end

  xit 'can display all contributor usernames' do
    visit '/admin/merchants'
    expect(page).to have_content("devAndrewK")
    expect(page).to have_content("tjhaines-cap")
    expect(page).to have_content("CoryBethune")
    expect(page).to have_content("StephenWilkens")
    expect(page).to have_content("ColinReinhart")
  end

  xit "displays the repo name" do
    visit "admin/merchants"

    expect(page).to have_content("Repo: little-esty-shop")

  end

  xit "displays each users amount of commits" do
    visit '/'

    expect(page).to have_content("devAndrewK has _ commits")
    expect(page).to have_content("tjhaines-cap has _ commits")
    expect(page).to have_content("CoryBethune has _ commits")
    expect(page).to have_content("StephenWilkens has _ commits")
    expect(page).to have_content("ColinReinhart has _ commits")

  end

  it "displays the next public holiday on the merchant discounts index page" do
    @merch1 = Merchant.create!(name: 'Corys Place')

    visit "/merchants/#{@merch1.id}/discounts"

    within("#header") do
      expect(page).to have_content("Upcoming Holidays")
      expect(page).to have_content("Juneteenth is on 2022-06-20.")
      expect(page).to have_content("Independence Day is on 2022-07-04.")
      expect(page).to have_content("Labour Day is on 2022-09-05.")
    end
  end
end
