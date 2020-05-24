require 'minitest/autorun'
require 'minitest/pride'
require './lib/item_collection'

class ItemCollectionTest < MiniTest::Test
  def setup
    @item_list = './fixtures/items_fixture.csv'
    @item_collection = ItemCollection.new(@item_list)
  end

  def test_it_exists
    assert_instance_of ItemCollection, @item_collection
  end

  def test_it_can_locate_the_file
    assert_equal './fixtures/items_fixture.csv', @item_collection.item_file
  end

  def test_it_can_find_all_items
    items = @item_collection.all

    assert_instance_of Array, item
    assert_equal 4, item.count
    assert_equal true, items.all? { |item| item.class == Item }
  end
end