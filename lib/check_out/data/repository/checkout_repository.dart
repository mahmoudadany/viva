
import 'package:viva/check_out/domain/base_repository/base_repository.dart';

class CheckOutRepository extends CheckOutBaseRepository{

  @override
  Future<void> paymentMethod(int amount, String currency,var context) async{
    // StripeManager.paymentIn(amount, currency, context);
  }

}