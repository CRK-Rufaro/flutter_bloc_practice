import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_practice/data/cart_items.dart';
import 'package:flutter_bloc_practice/data/wishlist_items.dart';
import 'package:flutter_bloc_practice/features/home/models/home_product_data_model.dart';
import 'package:flutter_bloc_practice/features/wishlist/ui/wishlist.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<RemoveFromWishlistEvent>(removeFromWishlistEvent);
    on<WishlistPageAddToCartEvent>(wishlistPageAddToCartEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistLoadedSuccesfullyState(wishlistItems: wishlistItems));
  }

  FutureOr<void> removeFromWishlistEvent(
      RemoveFromWishlistEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.removedWishlistItem);
    emit(WishlistLoadedSuccesfullyState(wishlistItems: wishlistItems));
    emit(RemovedFromWishlistState());
  }

  FutureOr<void> wishlistPageAddToCartEvent(
      WishlistPageAddToCartEvent event, Emitter<WishlistState> emit) {
    void notInCart() {
      cartItems.add(event.clickedProduct);
      emit(WishlistPageCartButtonClickedState(alreadyInCart: false));
    }

    void alreadyInCart() {
      //cartItems.add(event.clickedProduct);
      emit(WishlistPageCartButtonClickedState(alreadyInCart: true));
    }

    cartItems.contains(event.clickedProduct) ? alreadyInCart() : notInCart();
  }
}
