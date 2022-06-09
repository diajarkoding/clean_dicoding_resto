import 'package:clean_dicoding_resto/domain/entities/menu.dart';

import 'category_model.dart';

class MenusModel {
  MenusModel({
    required this.foods,
    required this.drinks,
  });

  List<CategoryModel> foods;
  List<CategoryModel> drinks;

  factory MenusModel.fromJson(Map<String, dynamic> json) => MenusModel(
        foods: List<CategoryModel>.from(
            json["foods"].map((x) => CategoryModel.fromJson(x))),
        drinks: List<CategoryModel>.from(
            json["drinks"].map((x) => CategoryModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
      };

  Menus toEntity() {
    return Menus(
      foods: foods.map((e) => e.toEntity()).toList(),
      drinks: drinks.map((e) => e.toEntity()).toList(),
    );
  }
}
