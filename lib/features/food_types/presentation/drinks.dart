import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/features/home/presentation/widgets/food_page_view.dart';
import 'package:the_food_hub_nsk_nig/features/food_types/data/models/food_type_item.dart';

class DrinksScreen extends StatelessWidget {
  const DrinksScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<FoodTypeItem> drinks = [
      FoodTypeItem(
          type: "Drink", name: "Coke", image: "assets/images/coke.jpg"),
      FoodTypeItem(
          type: "Drink", name: "Fanta", image: "assets/images/fanta.jpg"),
      FoodTypeItem(
          type: "Drink", name: "Sprite", image: "assets/images/sprite.jpg"),
      FoodTypeItem(
          type: "Meat", name: "Water", image: "assets/images/water.jpg"),
    ];

    return Scaffold(
        body: FoodPageView(
      navigate: (p1) {
        // Navigator.pushNamed(context, Routes.drinks);
      },
      category: drinks,
    ));
  }
}