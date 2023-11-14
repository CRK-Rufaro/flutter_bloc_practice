import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter_bloc_practice/features/wishlist/wishlist_tile_widget.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wishlistBloc.add(WishlistInitialEvent());
  }

  final WishlistBloc wishlistBloc = WishlistBloc();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Wishlist"),
        ),
        body: BlocConsumer<WishlistBloc, WishlistState>(
          listener: (BuildContext context, WishlistState state) {},
          bloc: wishlistBloc,
          listenWhen: (previous, current) => current is WishlistActionState,
          buildWhen: (previous, current) => current is! WishlistActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case WishlistLoadedSuccesfullyState:
                final successState = state as WishlistLoadedSuccesfullyState;
                return ListView.builder(
                    itemCount: successState.wishlistItems.length,
                    itemBuilder: (context, index) {
                      return WishlistTile(
                          productDataModel: successState.wishlistItems[index],
                          wishlistBloc: wishlistBloc);
                    });
            }
            return Container();
          },
        ));
  }
}
