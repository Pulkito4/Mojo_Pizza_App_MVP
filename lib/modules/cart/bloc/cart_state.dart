import 'package:equatable/equatable.dart';

class CartItem {
  final String pizzaId;
  final int quantity;
  final String pizzaName;
  final int price;
  final bool isVeg;

  CartItem({required this.pizzaId, this.quantity = 1, this.pizzaName = '', this.price = 0, this.isVeg = true});
}

class CartState extends Equatable {
  final List<CartItem> items;

  const CartState({this.items = const []});

  CartState copyWith({List<CartItem>? items}) {
    return CartState(
      items: items ?? this.items,
    );
  }

  @override
  List<Object> get props => [items];
}