import 'package:the_food_hub_nsk_nig/features/food_types/data/models/food.dart';
import 'package:uuid/uuid.dart';

class FoodTypeItem implements Food {
  @override
  final String id;

  @override
  final String name;
  @override
  final String image;
  @override
  final String type;
  @override
  final int price;

  FoodTypeItem({
    String? id, // Allow providing id, otherwise generate one
    required this.name,
    required this.price,
    required this.type,
    required this.image,
  }) : id = id ??
            const Uuid().v4(); // If id is not provided, generate a new one

  @override
  String toString() {
    return 'FoodCategory(id: $id, name: $name, image: $image)';
  }
}
