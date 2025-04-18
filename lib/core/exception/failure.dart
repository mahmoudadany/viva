import 'package:equatable/equatable.dart';

class Failure extends Equatable{
  String massage;
  Failure(this.massage);


  @override
  List<Object?> get props => [massage];

}