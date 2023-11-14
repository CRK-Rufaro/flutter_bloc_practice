import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_practice/features/home/models/home_product_data_model.dart';

class ProductTile extends StatefulWidget {
  final HomeBloc homeBloc;

  final ProductDataModel productDataModel;
  const ProductTile(
      {super.key, required this.productDataModel, required this.homeBloc});

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 200,
              width: double.maxFinite,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage(widget.productDataModel.imageUrl),
              )),
            ),
            SizedBox(height: 20),
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
                      width: 250,
                      height: 40,
                      //color: Colors.blue,
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
                    height: 40,
                    //color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        widget.productDataModel.likedState
                            ? IconButton(
                                color: Colors.red,
                                padding: EdgeInsets.zero,
                                iconSize: 28,
                                constraints: const BoxConstraints(
                                    minWidth: 22, maxWidth: 22),
                                hoverColor: Colors.redAccent,
                                //focusColor: Colors.redAccent.withOpacity(1),
                                highlightColor:
                                    Colors.redAccent.withOpacity(0.3),
                                splashColor: Colors.redAccent.withOpacity(0.3),
                                //splashColor: Colors.redAccent,
                                onPressed: () {
                                  widget.homeBloc.add(
                                      HomeProductWishlistButtonClickEvent(
                                          clickedProduct:
                                              widget.productDataModel));
                                  print(widget.productDataModel.likedState
                                      .toString());
                                  setState(() {
                                    widget.productDataModel.likedState =
                                        !widget.productDataModel.likedState;
                                  });
                                  // homeBloc.add(HomeNavigateToWishlistButtonClickEvent());
                                },
                                icon: Icon(Icons.favorite_rounded),
                              )
                            : IconButton(
                                color: Colors.white,
                                padding: EdgeInsets.zero,
                                iconSize: 28,
                                constraints: const BoxConstraints(
                                    minWidth: 22, maxWidth: 22),
                                hoverColor: Colors.redAccent,
                                splashColor: Colors.redAccent.withOpacity(0.3),
                                //focusColor: Colors.redAccent.withOpacity(0.3),
                                highlightColor:
                                    Colors.redAccent.withOpacity(0.3),
                                onPressed: () {
                                  widget.homeBloc.add(
                                      HomeProductWishlistButtonClickEvent(
                                          clickedProduct:
                                              widget.productDataModel));
                                  print(widget.productDataModel.likedState
                                      .toString());
                                  setState(() {
                                    widget.productDataModel.likedState =
                                        !widget.productDataModel.likedState;
                                  });
                                  // homeBloc.add(HomeNavigateToWishlistButtonClickEvent());
                                },
                                icon: Icon(Icons.favorite_border_outlined)),
                        SizedBox(
                          width: 15,
                        ),
                        IconButton(
                            color: Colors.white,
                            padding: EdgeInsets.zero,
                            iconSize: 28,
                            constraints: const BoxConstraints(
                                minWidth: 22, maxWidth: 22),
                            onPressed: () {
                              widget.homeBloc.add(
                                  HomeProductCartButtonClickEvent(
                                      clickedProduct: widget.productDataModel));
                            },
                            icon: Icon(Icons.shopping_cart_checkout_outlined)),
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
    );
  }
}
