import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/features/cart/ui/cart.dart';
import 'package:flutter_bloc_practice/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_practice/features/home/ui/product_tile_widget.dart';
import 'package:flutter_bloc_practice/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()))
              .then((value) => setState(() {}));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Wishlist()))
              .then((value) => setState(() {}));
        } else if (state is HomeProductAddedtoCartActionState) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: !state.alreadyInCart
                  ? Text("Added to cart")
                  : Text("Already in cart"),
              behavior: SnackBarBehavior.floating));
        } else if (state is HomeProductAddedtoWishlistActionState) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: !state.alreadyInWishlist
                  ? Text("Added to wishlist")
                  : Text("Removed from wishlist"),
              behavior: SnackBarBehavior.floating));
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessfullyState:
            final successState = state as HomeLoadedSuccessfullyState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.green,
                title: Text("Grocery App"),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeNavigateToWishlistButtonClickEvent());
                      },
                      icon: Icon(Icons.favorite_border_outlined)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeNavigateToCartButtonClickEvent());
                      },
                      icon: Icon(Icons.shopping_bag_outlined))
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductTile(
                      homeBloc: homeBloc,
                      productDataModel: successState.products[index],
                    );
                  }),
            );
          case HomeLoadingErrorState:
            return Scaffold(
              body: Center(
                child: Text("ERROR"),
              ),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
