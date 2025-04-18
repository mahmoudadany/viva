

import 'package:viva/home/domain/entities/Product.dart';

class CartItemModel extends Product{
  int userItemCount;
  bool check;
  String selectedSize;
  String selectedColor;
  CartItemModel(super.title, super.description, super.productId,super.mainCategory, super.subCategory, super.price, super.date, super.itemCount,super.images, super.size, super.colors, super.ratings, this.userItemCount, this.check, this.selectedSize, this.selectedColor);

  factory CartItemModel.fromProduct(Product prodect,int count,bool check,String selectedSize,String selectedColor)=>
      CartItemModel(
        prodect.title,
        prodect.description,
        prodect.productId,
        prodect.mainCategory,
        prodect.subCategory,
        prodect.price,
        prodect.date,
        prodect.itemCount,
        prodect.images,
        prodect.size,
        prodect.colors,
        prodect.ratings,
        count,
        check,
        selectedSize,
        selectedColor
      );



  factory CartItemModel.fromFirebase(Map<String,dynamic> json) =>
      CartItemModel(
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
        json['userItemCount'],
        json['check'],
        json['selectedSize'],
        json['selectedColor'],
      );




  @override
  Map<String, dynamic> toFirebase() =>
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
        "userItemCount":userItemCount,
        "check":check,
        "selectedSize":selectedSize,
        "selectedColor":selectedColor,
      };


}