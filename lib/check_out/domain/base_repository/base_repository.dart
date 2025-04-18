abstract class CheckOutBaseRepository{
  Future<void> paymentMethod(int amount, String currency,var context);
}