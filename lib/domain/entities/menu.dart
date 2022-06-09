import 'package:equatable/equatable.dart';

import 'category.dart';

class Menus extends Equatable {
  const Menus({
    required this.foods,
    required this.drinks,
  });

  final List<Category> foods;
  final List<Category> drinks;

  @override
  // TODO: implement props
  List<Object?> get props => [foods, drinks];
}
