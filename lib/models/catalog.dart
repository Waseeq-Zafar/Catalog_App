import 'dart:convert';

class CatalogModel {
  static final catModel = CatalogModel._internal();
  CatalogModel._internal();

  factory CatalogModel() => catModel;

  static List<Item> items = [
    Item(
      id: "234sq2",
      name: "IPHONE 14 pro max",
      desc: "iPhone 14 pro max",
      price: 145000,
      color: "#33505a",
      image:
          "https://m.media-amazon.com/images/I/61cwywLZR-L._AC_UF1000,1000_QL80_.jpg",
    )
  ];
  //get by id
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id.toString(), orElse: null);

  //get by position
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}
