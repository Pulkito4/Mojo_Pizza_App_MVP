import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {
  final String pizzaId;
  final String category;
  final String pizzaName;
  final int price;
  final bool isVeg;

  const AddToCart(
      this.pizzaId, this.category, this.pizzaName, this.price, this.isVeg);

  @override
  List<Object> get props => [pizzaId];
}

class IncreaseQuantity extends CartEvent {
  final String pizzaId;

  const IncreaseQuantity(this.pizzaId);

  @override
  List<Object> get props => [pizzaId];
}

class DecreaseQuantity extends CartEvent {
  final String pizzaId;

  const DecreaseQuantity(this.pizzaId);

  @override
  List<Object> get props => [pizzaId];
}

class AddTipEvent extends CartEvent {
  final double tip;

  const AddTipEvent(this.tip);
}
