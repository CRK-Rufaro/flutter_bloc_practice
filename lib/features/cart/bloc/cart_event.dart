part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent {
  final ProductDataModel removedCartItem;

  CartRemoveFromCartEvent({required this.removedCartItem});
}

class CartPageWishListButtonClickEvent extends CartEvent {
  final ProductDataModel clickedProduct;

  CartPageWishListButtonClickEvent({required this.clickedProduct});
}
