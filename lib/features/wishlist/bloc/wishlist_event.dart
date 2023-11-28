part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class RemoveFromWishlistEvent extends WishlistEvent {
  final ProductDataModel removedWishlistItem;

  RemoveFromWishlistEvent({required this.removedWishlistItem});
}

class WishlistPageAddToCartEvent extends WishlistEvent {
  final ProductDataModel clickedProduct;

  WishlistPageAddToCartEvent({required this.clickedProduct});
}

// class HomeProductCartButtonClickEvent extends HomeEvent {
//   final ProductDataModel clickedProduct;

//   HomeProductCartButtonClickEvent({required this.clickedProduct});
// }
