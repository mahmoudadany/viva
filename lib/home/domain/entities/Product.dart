import 'package:equatable/equatable.dart';

class Product extends Equatable{
  String title;
  String description;
  String productId;
  String mainCategory;
  String subCategory;
  String price;
  String date;
  int itemCount;
  List<dynamic> images;
  List<dynamic> size;
  List<dynamic> colors;
  Map<String,dynamic> ratings;

  Product(
      this.title,
      this.description,
      this.productId,
      this.mainCategory,
      this.subCategory,
      this.price,
      this.date,
      this.itemCount,
      this.images,
      this.size,
      this.colors,
      this.ratings
      );


  Map<String,dynamic> toFirebase()=>
      {
        "title":title,
        "description":description,
        "productId":productId,
        "mainCategory":mainCategory,
        "subCategory":subCategory,
        "price":price,
        "date":date,
        "itemCount":itemCount,
        "images":images,
        "size":size,
        "colors":colors,
        "ratings":ratings,
      };


  @override
  // TODO: implement props
  List<Object?> get props =>
      [
        title,
        description,
        productId,
        mainCategory,
        subCategory,
        price,
        date,
        itemCount,
        images,
        size,
        colors,
        ratings,
      ];

}