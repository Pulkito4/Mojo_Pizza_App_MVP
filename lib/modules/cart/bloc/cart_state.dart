import 'package:equatable/equatable.dart';

class CartItem {
  final String pizzaId;
  final int quantity;
  final String pizzaName;
  final int price;
  final bool isVeg;

  CartItem(
      {required this.pizzaId,
      this.quantity = 1,
      this.pizzaName = '',
      this.price = 0,
      this.isVeg = true});
}

class CartState extends Equatable {
  final List<CartItem> items;
  final double subTotal;
  final double total;
  final double tip;

  const CartState(
      {this.items = const [],
      this.subTotal = 0.0,
      this.total = 0.0,
      this.tip = 0.0});

  CartState copyWith(
      {List<CartItem>? items,
      double? packingCost,
      double? deliveryCost,
      double? tip,
      double? total}) {
    final newItems = items ?? this.items;
    final newTip = tip ?? this.tip;
    final newSubtotal =
        newItems.fold(0, (sum, item) => sum + item.price * item.quantity);
    final newTotal =
        newSubtotal + (packingCost ?? 0) + (deliveryCost ?? 0) + newTip;
    return CartState(
      items: items ?? this.items,
      subTotal: double.parse(newSubtotal.toString()),
      total: double.parse(newTotal.toString()),
      tip: newTip,
    );
  }

  @override
  List<Object> get props => [items, subTotal, total, tip];
}
