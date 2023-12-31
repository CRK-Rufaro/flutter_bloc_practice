part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

final class HomeInitial extends HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeLoadedSuccessfullyState extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadedSuccessfullyState({required this.products});
}

class HomeLoadingState extends HomeState {}

class HomeLoadingErrorState extends HomeState {}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeProductAddedtoWishlistActionState extends HomeActionState {
  final bool alreadyInWishlist;

  HomeProductAddedtoWishlistActionState({required this.alreadyInWishlist});
}

class HomeProductAddedtoCartActionState extends HomeActionState {
  final bool alreadyInCart;

  HomeProductAddedtoCartActionState({required this.alreadyInCart});
}
