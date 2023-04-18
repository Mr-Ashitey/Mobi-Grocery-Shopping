class GroceryList {
  int? id;
  String? name;
  List<GroceryItem>? items;

  GroceryList({required this.id, required this.name, required this.items});

  GroceryList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['items'] != null) {
      items = <GroceryItem>[];
      json['items'].forEach((v) {
        items!.add(GroceryItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  // Map<String, dynamic> toMap() {
  //   return {
  //     'name': name,
  //     'items': items.map((item) => item.toMap()).toList(),
  //   };
  // }

  // factory GroceryList.fromMap(Map<String, dynamic> map) {
  //   return GroceryList(
  //     name: map['name'],
  //     items: List<GroceryItem>.from(
  //         map['items'].map((item) => GroceryItem.fromMap(item))),
  //   );
  // }
}

class GroceryItem {
  String? name;
  bool? collected;

  GroceryItem({required this.name, this.collected = false});

  GroceryItem.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    collected = json['collected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['collected'] = collected;
    return data;
  }
}

List<GroceryList> groceryList = [
  GroceryList(
    id: 0,
    name: "My Grocery List",
    items: [
      GroceryItem(name: "Milk", collected: false),
      GroceryItem(name: "Bread", collected: true),
      GroceryItem(name: "Eggs", collected: false),
      GroceryItem(name: "Butter", collected: false),
      GroceryItem(name: "Cheese", collected: false),
      GroceryItem(name: "Yogurt", collected: true)
    ],
  ),
  GroceryList(id: 1, name: "Weekly Grocery List", items: [
    GroceryItem(name: "Apples", collected: true),
    GroceryItem(name: "Bananas", collected: false),
    GroceryItem(name: "Carrots", collected: false),
    GroceryItem(name: "Potatoes", collected: false),
    GroceryItem(name: "Ground Beef", collected: false),
    GroceryItem(name: "Chicken Breasts", collected: true),
    GroceryItem(name: "Pasta", collected: false),
    GroceryItem(name: "Tomato Sauce", collected: false),
    GroceryItem(name: "Bread", collected: true),
    GroceryItem(name: "Milk", collected: true)
  ]),
  GroceryList(id: 2, name: "Vegetarian Grocery List", items: [
    GroceryItem(name: "Tofu", collected: false),
    GroceryItem(name: "Lentils", collected: false),
    GroceryItem(name: "Chickpeas", collected: true),
    GroceryItem(name: "Quinoa", collected: false),
    GroceryItem(name: "Broccoli", collected: false),
    GroceryItem(name: "Kale", collected: true),
    GroceryItem(name: "Sweet Potatoes", collected: false),
    GroceryItem(name: "Avocado", collected: false),
    GroceryItem(name: "Hummus", collected: true)
  ]),
  GroceryList(id: 3, name: "Snack Grocery List", items: [
    GroceryItem(name: "Chips", collected: false),
    GroceryItem(name: "Popcorn", collected: false),
    GroceryItem(name: "Pretzels", collected: false),
    GroceryItem(name: "Trail Mix", collected: true),
    GroceryItem(name: "Chocolate", collected: false),
    GroceryItem(name: "Grapes", collected: true),
    GroceryItem(name: "Apple Slices", collected: false),
    GroceryItem(name: "Yogurt", collected: true)
  ])
];
