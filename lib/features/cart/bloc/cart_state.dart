part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

abstract class CartActionState extends CartState {}

class CartSuccessState extends CartState {
  final List<ProductDataModel> cartItems;

  CartSuccessState({required this.cartItems});
}

class CartProductRemovedFromCartState extends CartActionState {}

class CartWishlistButtonClick extends CartActionState {
  final bool alreadyInWishlist;

  CartWishlistButtonClick({required this.alreadyInWishlist});
}
