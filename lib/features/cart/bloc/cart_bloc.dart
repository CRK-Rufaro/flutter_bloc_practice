import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_practice/data/cart_items.dart';
import 'package:flutter_bloc_practice/data/wishlist_items.dart';
import 'package:flutter_bloc_practice/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_practice/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
    on<CartPageWishListButtonClickEvent>(cartPageWishListButtonClickEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.removedCartItem);
    emit(CartSuccessState(cartItems: cartItems));
    emit(CartProductRemovedFromCartState());
  }

  FutureOr<void> cartPageWishListButtonClickEvent(
      CartPageWishListButtonClickEvent event, Emitter<CartState> emit) {
    void alreadyInWishlist() {
      wishlistItems.remove(event.clickedProduct);
      emit(CartWishlistButtonClick(alreadyInWishlist: true));
    }

    void notInWishlist() {
      wishlistItems.add(event.clickedProduct);
      emit(CartWishlistButtonClick(alreadyInWishlist: false));
    }

    wishlistItems.contains(event.clickedProduct)
        ? alreadyInWishlist()
        : notInWishlist();
  } // the fix i need to apply to the wishlist page as well
}
