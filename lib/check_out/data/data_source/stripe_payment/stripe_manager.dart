// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:vivastore2/check_out/data/data_source/stripe_payment/stripe_key.dart';
// import 'package:vivastore2/check_out/presentaion/controller/check_out_conttroller.dart';
//
// abstract class StripeManager{
//
//   static Future<void> paymentIn(int amount,String currency,var context)async{
//     try{
//       String clientSecret= await _getClintSecret((amount*100).toString(),currency);
//        await _initPaymentSheet(clientSecret);
//        await Stripe.instance.presentPaymentSheet();
//       CheckOutController.paymentState.value=true;
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successful")));
//     }catch (error){
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("unsuccessful")));
//       print("qqqq ${error.toString()}");
//       CheckOutController.paymentState.value=false;
//       throw Exception(error.toString());
//     }
//   }
//
//   static Future<void> _initPaymentSheet(String clientSecret) async{
//     await Stripe.instance.initPaymentSheet(
//       paymentSheetParameters: SetupPaymentSheetParameters(
//         paymentIntentClientSecret: clientSecret,
//         merchantDisplayName: "Viva store",
//       ),
//     );
//   }
//
//   static Future<String> _getClintSecret(String amount,String currency)async{
//     Dio dio=Dio();
//     var response= await dio.post(
//       "https://api.stripe.com/v1/payment_intents",
//       options: Options(
//         headers: {
//           'Authorization': 'Bearer ${StripeKey.secretKey}',
//           'Content-Type': 'application/x-www-form-urlencoded',
//       },
//       ),
//       data: {
//         'amount': amount,
//         'currency': currency,
//       }
//     );
//     return response.data['client_secret'];
//   }
// }