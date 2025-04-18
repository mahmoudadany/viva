
import 'package:viva/home/data/model/cart_item_nodel.dart';
import 'package:viva/home/domain/base_repository/base_home_repository.dart';

class AddToCartUseCase{
  BaseHomeRepository baseHomeRepository;
  AddToCartUseCase(this.baseHomeRepository);

  Future<void> execute(CartItemModel cartModel)=>baseHomeRepository.addToCart(cartModel);
}