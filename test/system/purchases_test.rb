require "application_system_test_case"

class PurchasesTest < ApplicationSystemTestCase
  setup do
    visit login_path
    fill_in "Email", with: 'admin@admin.admin', match: :first
    fill_in "Password", with: 'admin', match: :first
    click_on 'Belépés'
    @purchase = purchases(:one)
  end

  test "visiting the index" do
    visit purchases_url
    assert_selector "h1", text: "Purchases"
  end

  test "creating a Purchase" do
    visit purchases_url
    click_on "New Purchase"

    fill_in "Product", with: @purchase.product_id
    fill_in "Quantity", with: @purchase.quantity
    fill_in "User", with: @purchase.user_id
    click_on "Create Purchase"

    assert_text "Purchase was successfully created"
    click_on "Back"
  end

  test "updating a Purchase" do
    visit purchases_url
    click_on "Edit", match: :first

    fill_in "Product", with: @purchase.product_id
    fill_in "Quantity", with: @purchase.quantity
    fill_in "User", with: @purchase.user_id
    click_on "Update Purchase"

    assert_text "Purchase was successfully updated"
    click_on "Back"
  end

  test "destroying a Purchase" do
    visit purchases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Purchase was successfully destroyed"
  end

  test "do purchase" do
    assert_difference('Purchase.count', 1) do
      visit products_url
      click_on "Kosárba", match: :first
    end
    assert_difference('Purchase.count', -1) do
      visit cart_url
      click_on "Rendelés"
    end

  end
end
