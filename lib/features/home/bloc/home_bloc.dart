import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_practice/data/cart_items.dart';
import 'package:flutter_bloc_practice/data/grocery_data.dart';
import 'package:flutter_bloc_practice/data/wishlist_items.dart';
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
    on<HomePageReloadEvent>(homePageReloadEvent);
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
    //print("Navigate to Cart Clicked");
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeNavigateToWishlistButtonClickEvent(
      HomeNavigateToWishlistButtonClickEvent event, Emitter<HomeState> emit) {
    //print("Navigate to Wishlist Clicked");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeProductCartButtonClickEvent(
      HomeProductCartButtonClickEvent event, Emitter<HomeState> emit) {
    //print("Cart Button Clicked");

    void addingToCart() {
      //print("Item added to cart");
      cartItems.add(event.clickedProduct);
      emit(HomeProductAddedtoCartActionState(alreadyInCart: false));
    }

    void alreadyInCart() {
      //print("Item already in cart");
      emit(HomeProductAddedtoCartActionState(alreadyInCart: true));
    }

    !(cartItems.contains(event.clickedProduct))
        ? addingToCart()
        : alreadyInCart();
    //emit(HomeLoadedSuccessfullyState(products: event.));
  }

  FutureOr<void> homeProductWishlistButtonClickEvent(
      HomeProductWishlistButtonClickEvent event, Emitter<HomeState> emit) {
    //print("Wishlist Button Clicked");

    void addingToWishlist() {
      wishlistItems.add(event.clickedProduct);
      emit(HomeProductAddedtoWishlistActionState(alreadyInWishlist: false));
    }

    void removingFromWishlist() {
      wishlistItems.remove(event.clickedProduct);
      emit(HomeProductAddedtoWishlistActionState(alreadyInWishlist: true));
    }

    !wishlistItems.contains(event.clickedProduct)
        ? addingToWishlist()
        : removingFromWishlist();
  }

  FutureOr<void> homePageReloadEvent(
      HomePageReloadEvent event, Emitter<HomeState> emit) {}
}
