
import 'package:viva/home/data/model/cart_item_nodel.dart';
import 'package:viva/home/domain/base_repository/base_home_repository.dart';

class GetCartItemsUseCase{
  BaseHomeRepository baseHomeRepository;
  GetCartItemsUseCase(this.baseHomeRepository);

   Future<List<CartItemModel>> execute()=>baseHomeRepository.getCartItem();
}