

import 'package:viva/auth/domain/entities/user.dart';
import 'package:viva/home/domain/base_repository/base_home_repository.dart';

class GetUserUseCase{
  BaseHomeRepository baseHomeRepository;
  GetUserUseCase(this.baseHomeRepository);

  Future<MainUser> execute()=>baseHomeRepository.getUser();

}