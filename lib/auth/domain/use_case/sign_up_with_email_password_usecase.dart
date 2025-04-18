import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:viva/auth/domain/base_repository/base_auth_repository.dart';
import 'package:viva/core/exception/failure.dart';



class SignUpWithEmailAndPasswordUseCase{
  BaseAuthRepository baseAuthRepository;
  SignUpWithEmailAndPasswordUseCase(this.baseAuthRepository);

  Future<Either<Failure,User>> execute(String email,String password)=>baseAuthRepository.signUpWithEmailAndPassword(email, password);

}