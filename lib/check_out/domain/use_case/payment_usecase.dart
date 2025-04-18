
import 'package:viva/check_out/domain/base_repository/base_repository.dart';

class PaymentUseCase{
  CheckOutBaseRepository checkOutBaseRepository;
  PaymentUseCase(this.checkOutBaseRepository);

  Future<void> execute(int amount, String currency,var context)=>checkOutBaseRepository.paymentMethod(amount, currency,context);
}