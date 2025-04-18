import 'package:equatable/equatable.dart';

abstract class MainUser extends Equatable {
  String id;
  String? name;
  String? email;
  String? picture;
  String? phoneNumber;

  MainUser({
    required this.id,
    this.name,
    this.email,
    this.picture,
    this.phoneNumber,
  });

  Map<String,dynamic> toMap()=>
      {
        'id':id,
        'name':name,
        'email':email,
        'picture':picture,
        'phoneNumber':phoneNumber,
      };


  @override
  List<Object?> get props =>
      [
        id,
        name,
        email,
        picture,
        phoneNumber,
      ];
}
