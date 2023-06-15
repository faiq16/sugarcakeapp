import 'category.dart';
import 'ingredient.dart';

class Cake {
  final String? name;
  final String? description;
  final String? image;
  final double? price;
  final double? rating;
  final double? time;
  final List<Ingredient>? ingredients;
  final List<Category>? categories;

  Cake({this.name, this.description, this.image, this.price, this.ingredients, this.categories, this.rating, this.time,});
}

List cakes = [
  Cake(
    name: 'Bacon with Jalapeno and cheese',
    description: 'Cake 1 description',
    image: '',
    price: 10.0,
    ingredients: [ingredients[0], ingredients[11], ingredients[1], ingredients[7]],
    categories: [categories[0], categories[1]],
    rating: 4.8,
    time: 15,
  ),
  Cake(
    name: 'Extra pickles and cheese',
    description: 'Cake 2 description',
    image: '',
    price: 12.0,
    ingredients: [ingredients[6], ingredients[7], ingredients[1], ingredients[5]],
    categories: [categories[0], categories[1]],
    rating: 4.8,
    time: 25,
  ),
  Cake(
    name: 'Classic with cheese',
    description: 'Cake 3 description',
    image: '',
    price: 15.0,
    ingredients: [ingredients[7], ingredients[1], ingredients[3], ingredients[4], ingredients[5]],
    categories: [categories[0], categories[1]],
    rating: 4.9,
    time: 5,
  ),
  Cake(
    name: 'Three meat floor',
    description: 'Cake 4 description',
    image: '',
    price: 20.0,
    ingredients: [ingredients[7], ingredients[0], ingredients[1]],
    categories: [categories[0], categories[1]],
    rating: 4.6,
    time: 12,
  ),
];