import 'package:uuid/uuid.dart';

class GroceryList {
  String? id;
  String? name;
  List<GroceryItem>? items;

  GroceryList({required this.name, List<GroceryItem>? items})
      : id = const Uuid().v4(),
        items = items ?? [];

  int get numItems => items!.length;

  int get numItemsCollected =>
      items!.where((item) => item.collected!).toList().length;

  bool get allItemsCollected => items!.every((item) => item.collected!);

  GroceryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    data['id'] = id;
    data['name'] = name;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GroceryItem {
  String? id;
  String? name;
  bool? collected;

  GroceryItem({required this.name, this.collected = false})
      : id = const Uuid().v4();

  GroceryItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    collected = json['collected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['collected'] = collected;
    return data;
  }
}
