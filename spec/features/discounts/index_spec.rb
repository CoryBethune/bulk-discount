require 'rails_helper'

RSpec.describe 'discount index' do
  before(:each) do
    @merch_1 = Merchant.create!(name: "Two-Legs Fashion")
    @merch_2 = Merchant.create!(name: "Paper Bois")

    @discount_1 = @merch_1.discounts.create!(quantity: 10, percent_discount: 30)
    @discount_2 = @merch_1.discounts.create!(quantity: 20, percent_discount: 45)
    @discount_3 = @merch_2.discounts.create!(quantity: 5, percent_discount: 15)

    @item_1 = @merch_1.items.create!(name: "Two-Leg Pantaloons", description: "pants built for people with two legs", unit_price: 5000)
    @item_2 = @merch_1.items.create!(name: "Two-Leg Shorts", description: "shorts built for people with two legs", unit_price: 3000)
    @item_3 = @merch_1.items.create!(name: "Hat", description: "hat built for people with two legs and one head", unit_price: 6000)
    @item_4 = @merch_1.items.create!(name: "Double Legged Pant", description: "pants built for people with two legs", unit_price: 50000)
    @item_5 = @merch_1.items.create!(name: "Stainless Steel, 5-Pocket Jean", description: "Shorts of Steel", unit_price: 3000000)
    @item_6 = @merch_1.items.create!(name: "String of Numbers", description: "54921752964273", unit_price: 100)

    @cust_1 = Customer.create!(first_name: "Debbie", last_name: "Twolegs")
    @cust_2 = Customer.create!(first_name: "Tommy", last_name: "Doubleleg")
    @cust_3 = Customer.create!(first_name: "Brian", last_name: "Twinlegs")
    @cust_4 = Customer.create!(first_name: "Jared", last_name: "Goffleg")
    @cust_5 = Customer.create!(first_name: "Pistol", last_name: "Pete")
    @cust_6 = Customer.create!(first_name: "Bronson", last_name: "Shmonson")
    @cust_7 = Customer.create!(first_name: "Anten", last_name: "Branden")

    @invoice_1 = @cust_1.invoices.create!(status: 1)
    @invoice_2 = @cust_1.invoices.create!(status: 1)
    @invoice_3 = @cust_1.invoices.create!(status: 1)
    @invoice_4 = @cust_2.invoices.create!(status: 1)
    @invoice_5 = @cust_2.invoices.create!(status: 1)
    @invoice_6 = @cust_2.invoices.create!(status: 1)
    @invoice_7 = @cust_3.invoices.create!(status: 1)
    @invoice_8 = @cust_3.invoices.create!(status: 1)
    @invoice_9 = @cust_4.invoices.create!(status: 1)
    @invoice_10 = @cust_4.invoices.create!(status: 1)
    @invoice_11 = @cust_5.invoices.create!(status: 1)
    @invoice_12 = @cust_5.invoices.create!(status: 1)
    @invoice_13 = @cust_6.invoices.create!(status: 1)
    @invoice_14 = @cust_7.invoices.create!(status: 1)
    @invoice_15 = @cust_7.invoices.create!(status: 2)

    @ii_1 = InvoiceItem.create!(item_id: @item_1.id, invoice_id: @invoice_1.id, quantity: 1, unit_price: @item_1.unit_price, status: 2)
    @ii_2 = InvoiceItem.create!(item_id: @item_1.id, invoice_id: @invoice_2.id, quantity: 1, unit_price: @item_1.unit_price, status: 2)
    @ii_3 = InvoiceItem.create!(item_id: @item_1.id, invoice_id: @invoice_3.id, quantity: 1, unit_price: @item_1.unit_price, status: 2)
    @ii_4 = InvoiceItem.create!(item_id: @item_1.id, invoice_id: @invoice_4.id, quantity: 1, unit_price: @item_1.unit_price, status: 2)
    @ii_5 = InvoiceItem.create!(item_id: @item_1.id, invoice_id: @invoice_5.id, quantity: 1, unit_price: @item_1.unit_price, status: 2)
    @ii_6 = InvoiceItem.create!(item_id: @item_1.id, invoice_id: @invoice_6.id, quantity: 1, unit_price: @item_1.unit_price, status: 2)
    @ii_7 = InvoiceItem.create!(item_id: @item_1.id, invoice_id: @invoice_7.id, quantity: 1, unit_price: @item_1.unit_price, status: 2)
    @ii_8 = InvoiceItem.create!(item_id: @item_1.id, invoice_id: @invoice_8.id, quantity: 1, unit_price: @item_1.unit_price, status: 2)
    @ii_9 = InvoiceItem.create!(item_id: @item_1.id, invoice_id: @invoice_9.id, quantity: 1, unit_price: @item_1.unit_price, status: 2)
    @ii_10 = InvoiceItem.create!(item_id: @item_1.id, invoice_id: @invoice_10.id, quantity: 1, unit_price: @item_1.unit_price, status: 2)

    @ii_11 = InvoiceItem.create!(item_id: @item_1.id, invoice_id: @invoice_11.id, quantity: 1, unit_price: @item_1.unit_price, status: 2)
    @ii_12 = InvoiceItem.create!(item_id: @item_1.id, invoice_id: @invoice_12.id, quantity: 1, unit_price: @item_1.unit_price, status: 2)
    @ii_13 = InvoiceItem.create!(item_id: @item_1.id, invoice_id: @invoice_13.id, quantity: 1, unit_price: @item_1.unit_price, status: 2)
    @ii_14 = InvoiceItem.create!(item_id: @item_4.id, invoice_id: @invoice_14.id, quantity: 500, unit_price: @item_4.unit_price, status: 2)
    @ii_15 = InvoiceItem.create!(item_id: @item_6.id, invoice_id: @invoice_14.id, quantity: 1, unit_price: @item_4.unit_price, status: 2)
    @ii_16 = InvoiceItem.create!(item_id: @item_1.id, invoice_id: @invoice_14.id, quantity: 30, unit_price: @item_1.unit_price, status: 2)
    @ii_17 = InvoiceItem.create!(item_id: @item_2.id, invoice_id: @invoice_14.id, quantity: 30, unit_price: @item_2.unit_price, status: 2)
    @ii_18 = InvoiceItem.create!(item_id: @item_3.id, invoice_id: @invoice_14.id, quantity: 30, unit_price: @item_3.unit_price, status: 2)
    @ii_19 = InvoiceItem.create!(item_id: @item_5.id, invoice_id: @invoice_15.id, quantity: 700, unit_price: @item_4.unit_price, status: 0)
  end

  it "displays all of the discounts associated with a merchant and links to each discounts show page" do
    visit "merchants/#{@merch_1.id}/discounts"

    within("discount-#{@discount_1.id}") do
      expect(page).to have_content(@discount_1.quantity)
      expect(page).to have_content(@discount_1.percent_discount)
      expect(page).to_not have_content(@discount_3.quantity)
      expect(page).to_not have_content(@discount_3.percent_discount)

      click_link "Discount Show Page"
      expect(current_path).to eq("/discounts/#{@discount_1}")
    end
    within("discount-#{@discount_2.id}") do
      expect(page).to have_content(@discount_2.quantity)
      expect(page).to have_content(@discount_2.percent_discount)
      expect(page).to_not have_content(@discount_3.quantity)
      expect(page).to_not have_content(@discount_3.percent_discount)

      click_link "Discount Show Page"
      expect(current_path).to eq("/discounts/#{@discount_2}")
    end
  end

  it "has a link to create a new discount and displays the newly created discount" do
    visit "merchants/#{@merch_1.id}/discounts"

    click_link "Create New Discount"
    expect(current_path).to eq("merchants/#{@merch_1.id}/discounts/new")
    latest = Discounts.last

    within("discount-#{latest.id}") do
      expect(page).to have_content(latest.quantity)
      expect(page).to have_content(latest.percent_discount)
      expect(page).to_not have_content(@discount_2.quantity)
      expect(page).to_not have_content(@discount_2.percent_discount)
    end
  end

end
