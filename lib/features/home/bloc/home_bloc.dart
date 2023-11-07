import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_practice/data/grocery_data.dart';
import 'package:flutter_bloc_practice/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    //on initialization
    on<HomeInitialEvent>(homeInitialEvent);
    //Navigation
    on<HomeNavigateToCartButtonClickEvent>(homeNavigateToCartButtonClickEvent);
    on<HomeNavigateToWishlistButtonClickEvent>(
        homeNavigateToWishlistButtonClickEvent);

    //Button Clicks
    on<HomeProductCartButtonClickEvent>(homeProductCartButtonClickEvent);
    on<HomeProductWishlistButtonClickEvent>(
        homeProductWishlistButtonClickEvent);
  }

  //Event Handlers

  Future<FutureOr<void>> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    //simulating loading
    await Future.delayed(Duration(seconds: 3));

    emit(HomeLoadedSuccessfullyState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> homeNavigateToCartButtonClickEvent(
      HomeNavigateToCartButtonClickEvent event, Emitter<HomeState> emit) {
    print("Navigate to Cart Clicked");
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeNavigateToWishlistButtonClickEvent(
      HomeNavigateToWishlistButtonClickEvent event, Emitter<HomeState> emit) {
    print("Navigate to Wishlist Clicked");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeProductCartButtonClickEvent(
      HomeProductCartButtonClickEvent event, Emitter<HomeState> emit) {
    print("Cart Button Clicked");
  }

  FutureOr<void> homeProductWishlistButtonClickEvent(
      HomeProductWishlistButtonClickEvent event, Emitter<HomeState> emit) {
    print("Wishlist Button Clicked");
  }
}
