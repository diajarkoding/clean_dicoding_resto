import 'package:clean_dicoding_resto/domain/entities/category.dart';

class CategoryModel {
  CategoryModel({
    required this.name,
  });

  String name;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };

  Category toEntity() {
    return Category(name: name);
  }
}
