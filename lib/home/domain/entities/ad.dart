import 'package:equatable/equatable.dart';

class Ad extends Equatable{

  String companyName;
  String companyImage;
  String adImage;

  Ad(this.companyName,this.companyImage,this.adImage);

  Map<String,dynamic> toFirebase()=>
      {
        "companyName":companyName,
        "companyImage":companyImage,
        "adImage":adImage,
      };


  @override
  // TODO: implement props
  List<Object?> get props => [
    companyName,
    companyImage,
    adImage,
  ];

}