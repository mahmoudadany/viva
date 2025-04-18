
import 'package:viva/home/domain/base_repository/base_home_repository.dart';
import 'package:viva/home/domain/entities/Product.dart';

class GetWearProductUseCase{
  BaseHomeRepository baseHomeRepository;
  GetWearProductUseCase(this.baseHomeRepository);

  Future<List<Product>> execute()=>baseHomeRepository.getProduct();
}