import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc_practice/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_practice/features/home/models/home_product_data_model.dart';
import 'package:flutter_bloc_practice/features/wishlist/bloc/wishlist_bloc.dart';

class WishlistTile extends StatefulWidget {
  final WishlistBloc wishlistBloc;

  final ProductDataModel productDataModel;
  const WishlistTile(
      {super.key, required this.productDataModel, required this.wishlistBloc});

  @override
  State<WishlistTile> createState() => _WishlistTileState();
}

class _WishlistTileState extends State<WishlistTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            // margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(widget.productDataModel.imageUrl),
            )),
          ),
          // SizedBox(height: 20),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.productDataModel.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 80,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 10),
                      //padding: EdgeInsets.only(right: 10),
                      // color: Colors.red,
                      //margin: EdgeInsets.only(right: 13),
                      child: Text(
                        'R${widget.productDataModel.price * 19}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 200,
                        // height: 50,
                        // color: Colors.blue,
                        child: Text(
                          widget.productDataModel.description,
                          softWrap: true,
                        )),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade700.withOpacity(0.3),
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(10))),
                      //width: 90,
                      height: 50,
                      //color: Colors.amber,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              color: Colors.white,
                              padding: EdgeInsets.zero,
                              iconSize: 28,
                              constraints: const BoxConstraints(
                                  minWidth: 22, maxWidth: 22),
                              onPressed: () {
                                widget.wishlistBloc.add(
                                    WishlistPageAddToCartEvent(
                                        clickedProduct:
                                            widget.productDataModel));
                                // widget.cartBloc.add(CartRemoveFromCartEvent(
                                //     removedCartItem: widget.productDataModel));
                              },
                              icon: Icon(Icons.add_shopping_cart_rounded)),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              color: Colors.white,
                              padding: EdgeInsets.zero,
                              iconSize: 28,
                              constraints: const BoxConstraints(
                                  minWidth: 22, maxWidth: 22),
                              onPressed: () {
                                widget.wishlistBloc.add(RemoveFromWishlistEvent(
                                    removedWishlistItem:
                                        widget.productDataModel));
                                // widget.cartBloc.add(CartRemoveFromCartEvent(
                                //     removedCartItem: widget.productDataModel));
                              },
                              icon: Icon(Icons.remove_circle_outline)),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
