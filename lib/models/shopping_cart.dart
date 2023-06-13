import 'cake.dart';
class ShoppingCart {

  final totalPrice = 0.0;
  final discount = 0.0;


  final List<List<Cake>> _items = [];

  List<List<Cake>> get items => _items;
  add(Cake cake) {
    _items.add([cake]);
  }
  remove(Cake cake) {
    _items.remove([cake]);
  }

  double get total => totalPrice - discount;
  double get totalDiscount => discount;
  double get totalWithoutDiscount => totalPrice;


  List<Cake> baconBurgers = [];

}