import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:viva/auth/domain/entities/user.dart';
import 'package:viva/core/exception/failure.dart';


abstract class BaseAuthRepository{

  // List<OnBoarding> showOnBoardingItem();

  Future<Either<Failure,User>> signInWithGoogleOrFacebook(AuthCredential authCredential);

  Future<Either<Failure,User>> signInWithEmailAndPassword(String email,String password);

  Future<Either<Failure,User>> signUpWithEmailAndPassword(String email,String password);

  Future<Either<Failure,bool>> addUserInUserCollection(MainUser user);

  // Future<Either<Failure,MainUser>> signInWithFacebook(AuthCredential credential);


}