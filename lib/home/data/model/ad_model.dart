

import 'package:viva/home/domain/entities/ad.dart';

class AdModel extends Ad{
  AdModel(super.companyName, super.companyImage, super.adImage);

  factory AdModel.fromFirebase(Map<String,dynamic> json) =>
      AdModel(
        json['companyName'],
        json['companyImage'],
        json['adImage'],
      );

}