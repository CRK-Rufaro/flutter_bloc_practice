part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickEvent extends HomeEvent {}

class HomeProductCartButtonClickEvent extends HomeEvent {}

class HomeNavigateToCartButtonClickEvent extends HomeEvent {}

class HomeNavigateToWishlistButtonClickEvent extends HomeEvent {}
