import 'package:flutter1_app/models/catalog.dart';

class CartModel {
  //singelton class
  static final cartModel = CartModel._internal();
  CartModel._internal();

  factory CartModel() => cartModel;
  //above tak singelton

  late CatalogModel _catalog;
  final List<int> _itemIds = [];

  // Constructor that takes an initial catalog
  //CartModel(this._catalog);

  // Getter for the catalog
  CatalogModel get catalog => _catalog;

  // Setter for the catalog
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get total price

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //add items

  void add(Item item) {
    String stringValue = item.id;
    int intValue = int.parse(stringValue);
    _itemIds.add(intValue);
  }

  //remove item

  void remove(Item item) {
    String stringValue = item.id;
    int intValue = int.parse(stringValue);
    _itemIds.remove(intValue);
  }
}
