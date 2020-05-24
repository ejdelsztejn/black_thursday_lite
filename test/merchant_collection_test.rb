require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant_collection'

class MerchantCollectionTest < MiniTest::Test
  def setup
    @merchant_list = './fixtures/merchants_fixture.csv'
    @merchant_collection = MerchantCollection.new(@merchant_list)
  end

  def test_it_exists
    assert_instance_of MerchantCollection, @merchant_collection
  end

  def test_it_can_locate_the_file
    assert_equal './fixtures/merchants_fixture.csv', @merchant_collection.merchant_file
  end

  def test_it_can_find_all_merchants
    merchants = @merchant_collection.all

    assert_instance_of Array, merchants
    assert_equal 4, merchants.count
    assert_equal true, merchants.all? { |merchant| merchant.class == Merchant }
  end

  def test_it_can_find_a_merchant_by_id
    merchant = @merchant_collection.find("12334105")

    assert_instance_of Merchant, merchant
    assert_equal "Shopin1901", merchant.name
  end
end
