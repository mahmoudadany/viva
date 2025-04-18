

import 'package:viva/home/domain/entities/Product.dart';

class ProductModel extends Product{
  ProductModel(super.title, super.description, super.productId, super.mainCategory, super.subCategory, super.price, super.date, super.itemCount, super.images,super.size, super.colors,super.ratings, );



  factory ProductModel.fromFirebase(Map<String,dynamic> json) =>
      ProductModel(
        json['title'],
        json['description'],
        json['productId'],
        json['mainCategory'],
        json['subCategory'],
        json['price'],
        json['date'],
        json['itemCount'],
        json['images'],
        json['size'],
        json['colors'],
        json['ratings'],
      );


}