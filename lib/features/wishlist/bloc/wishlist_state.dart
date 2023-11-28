part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

abstract class WishlistActionState extends WishlistState {}

class WishlistLoadedSuccesfullyState extends WishlistState {
  final List<ProductDataModel> wishlistItems;

  WishlistLoadedSuccesfullyState({required this.wishlistItems});
}

class WishlistPageCartButtonClickedState extends WishlistActionState {
  final bool alreadyInCart;

  WishlistPageCartButtonClickedState({required this.alreadyInCart});
}

class RemovedFromWishlistState extends WishlistActionState {}
