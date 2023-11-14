import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_practice/data/wishlist_items.dart';
import 'package:flutter_bloc_practice/features/home/models/home_product_data_model.dart';
import 'package:flutter_bloc_practice/features/wishlist/wishlist.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistLoadedSuccesfullyState(wishlistItems: wishlistItems));
  }
}
