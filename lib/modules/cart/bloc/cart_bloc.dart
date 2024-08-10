import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final FirebaseFirestore firestore;

  CartBloc(this.firestore) : super(const CartState()) {
    on<AddToCart>(_onAddToCart);
    on<IncreaseQuantity>(_onIncreaseQuantity);
    on<DecreaseQuantity>(_onDecreaseQuantity);
  }

  Future<void> _onAddToCart(AddToCart event, Emitter<CartState> emit) async {
    final pizzaDoc = await firestore
        .collection('menu')
        .doc('Category') // Adjust this to the specific category document ID
        .collection(event
            .category) // Adjust this to the specific sub-category collection
        .doc(event.pizzaId)
        .get();

    if (pizzaDoc.exists) {
      final pizzaData = pizzaDoc.data();
      final existingItem = state.items.firstWhere(
        (item) => item.pizzaId == event.pizzaId,
        orElse: () => CartItem(
          pizzaId: event.pizzaId,
          pizzaName: pizzaData?['title'] ?? '',
          price: pizzaData?['price'] ?? 0,
          isVeg: pizzaData?['isVeg'] ?? true,
        ),
      );

      final updatedItems = List<CartItem>.from(state.items);
      if (existingItem.quantity == 1) {
        updatedItems.add(existingItem);
      }

      emit(state.copyWith(items: updatedItems));
    }
  }

  void _onIncreaseQuantity(IncreaseQuantity event, Emitter<CartState> emit) {
    final updatedItems = state.items.map((item) {
      if (item.pizzaId == event.pizzaId) {
        return CartItem(pizzaId: item.pizzaId, quantity: item.quantity + 1, pizzaName: item.pizzaName, price: item.price, isVeg: item.isVeg);
      }
      return item;
    }).toList();

    emit(state.copyWith(items: updatedItems));
  }

  void _onDecreaseQuantity(DecreaseQuantity event, Emitter<CartState> emit) {
    final updatedItems = state.items
        .map((item) {
          if (item.pizzaId == event.pizzaId && item.quantity > 1) {
            return CartItem(pizzaId: item.pizzaId, quantity: item.quantity - 1, pizzaName: item.pizzaName, price: item.price, isVeg: item.isVeg);
          }
          return item;
        })
        .where((item) => item.quantity > 0)
        .toList();

    emit(state.copyWith(items: updatedItems));
  }
}
