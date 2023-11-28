class ProductDataModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  //bool likedState;
  //all of this data is supposed to be obtained from firebase but that will be implemented in version 2 of this application

  ProductDataModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    //this.likedState = false
  });
}
