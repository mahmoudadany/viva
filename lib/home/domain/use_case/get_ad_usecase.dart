
import 'package:viva/home/domain/base_repository/base_home_repository.dart';
import 'package:viva/home/domain/entities/ad.dart';

class GetAdUseCase{
  BaseHomeRepository baseHomeRepository;
  GetAdUseCase(this.baseHomeRepository);

  Future<List<Ad>> execute()=>baseHomeRepository.getAd();}