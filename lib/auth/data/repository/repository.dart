import 'package:either_dart/src/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:viva/auth/data/data_source/remote/firebase/auth_function.dart';
import 'package:viva/auth/domain/base_repository/base_auth_repository.dart';
import 'package:viva/auth/domain/entities/user.dart';
import 'package:viva/core/exception/failure.dart';


class AuthRepository extends BaseAuthRepository {

  BaseFirebaseAuthRemoteDataSource baseFirebaseAuthRemoteDataSource;
  AuthRepository._(this.baseFirebaseAuthRemoteDataSource);
  static   AuthRepository? _authRepository;
  factory AuthRepository(BaseFirebaseAuthRemoteDataSource baseFirebaseAuthRemoteDataSource) {
     _authRepository ??= AuthRepository._(baseFirebaseAuthRemoteDataSource);
    return _authRepository!;
  }

  @override
  Future<Either<Failure, User>> signInWithGoogleOrFacebook(
    AuthCredential authCredential,
  ) async {
    try {
      User user = await baseFirebaseAuthRemoteDataSource
          .authWithGoogleOrFacebook(authCredential);
      return Right(user);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      User user = await baseFirebaseAuthRemoteDataSource
          .authWithEmailAndPassword(email, password);
      return Right(user);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      User user = await baseFirebaseAuthRemoteDataSource
          .signUpWithEmailAndPassword(email, password);
      return Right(user);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> addUserInUserCollection(MainUser user) async {
    try {
      await baseFirebaseAuthRemoteDataSource.addUserInUserCollection(user);
      return Right(true);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}

// @override
// Future<Either<Failure, MainUser>> signInWithFacebook(AuthCredential credential) async{
//  try{
//    UserModel userModel=await baseFirebaseAuthRemoteDataSource.authWithGoogleOrFacebook(credential);
//    return Right(userModel);
//  }catch (e){
//    return Left(Failure(e.toString()));
//  }
// }
