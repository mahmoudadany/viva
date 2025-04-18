// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:viva_store/core/globle/app_color/app_color_light.dart';
// import 'package:viva_store/home/presentaion/controller/home_controller.dart';
//
// class CartScreen extends GetWidget<HomeController> {
//   const CartScreen({super.key});
//
//   // bool t=false;
//   @override
//   Widget build(BuildContext context) {
//     controller.getCartItems();
//     return Scaffold(
//       // appBar: AppBar
//       //   (
//       //   title: Text("Your Cart",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),),
//       //   centerTitle: true,
//       // ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.separated(
//               itemBuilder:
//                   (context, index) => Padding(
//                     padding: const EdgeInsetsDirectional.symmetric(
//                       horizontal: 10.0,
//                       vertical: 5.0,
//                     ),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.0),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 2,
//                             blurRadius: 10,
//                             offset: Offset(4, 4),
//                           ),
//                         ],
//                       ),
//                       clipBehavior: Clip.antiAliasWithSaveLayer,
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             height: 150,
//                             width: 120,
//                             child: Image(
//                               image: NetworkImage(
//                                 controller.cartItems[index].images[0],
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 5.0),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const SizedBox(height: 10.0),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       controller.cartItems[index].title,
//                                       style: TextStyle(
//                                         fontSize: 20.0,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Obx(() =>  Checkbox(
//                                         value: controller.cartItems[index].check,
//                                         activeColor:
//                                             AppColorLight.ratingStarColor,
//                                         onChanged: (value) {
//                                           controller.cartItems[index].check=value;
//                                         },
//
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Text(
//                                   "\$ ${controller.cartItems[index].price}",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 25.0,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 5.0),
//                                 Row(
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "Size: ${controller.cartItems[index].size[0]}",
//                                           style: TextStyle(
//                                             color: Colors.grey,
//                                             fontSize: 16.0,
//                                           ),
//                                         ),
//                                         // Text(
//                                         //   "Color: ${controller.cartItems[index].color[0]}",
//                                         //   style: TextStyle(
//                                         //     color: Colors.grey,
//                                         //     fontSize: 16.0,
//                                         //   ),
//                                         // ),
//                                       ],
//                                     ),
//                                     Expanded(child: SizedBox()),
//                                     Container(
//                                       padding: EdgeInsetsDirectional.symmetric(
//                                         horizontal: 5.0,
//                                         vertical: 5.0,
//                                       ),
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(
//                                           20.0,
//                                         ),
//                                         border: Border.all(
//                                           color: Colors.grey,
//                                           width: 2,
//                                         ),
//                                       ),
//                                       clipBehavior: Clip.antiAliasWithSaveLayer,
//                                       child: Row(
//                                         children: [
//                                           GestureDetector(
//                                             child: Icon(
//                                               Icons.remove,
//                                               color: Colors.grey,
//                                             ),
//                                             onTap: () {
//                                               int count=controller.cartItems[index].userItemCount;
//                                               if(count==1){
//                                                 Get.snackbar("Cart failure", "you shoud chose one item");
//                                                 return;
//                                               }
//                                               controller.cartItems[index].userItemCount--;
//                                             },
//                                           ),
//                                           const SizedBox(width: 10.0),
//                                           Obx(() => Text(
//                                               controller.cartItems[index].userItemCount.toString(),
//                                               style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 20.0,
//                                               ),
//                                             ),
//                                           ),
//                                           const SizedBox(width: 10.0),
//                                           GestureDetector(
//                                             child: Icon(
//                                               Icons.add,
//                                               color: Colors.grey,
//                                             ),
//                                             onTap: () {
//                                               int count=controller.cartItems[index].userItemCount;
//                                               if(count>controller.cartItems[index].itemCount){
//                                                 Get.snackbar("Cart failure", "you shoud chose one item2");
//                                                 return;
//                                               }
//                                               controller.cartItems[index].userItemCount++;
//                                             },
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     const SizedBox(width: 10.0),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//               separatorBuilder:
//                   (context, index) => const SizedBox(height: 10.0),
//               itemCount: controller.cartItems.value.length,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Container(
//               child: Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const SizedBox(height: 10.0),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Product Price",
//                           style: TextStyle(color: Colors.grey, fontSize: 20.0),
//                         ),
//                         Text("\$110", style: TextStyle(fontSize: 20.0)),
//                       ],
//                     ),
//                     const SizedBox(height: 20.0),
//                     Container(
//                       height: 1.0,
//                       width: double.infinity,
//                       color: Colors.grey.shade300,
//                     ),
//                     const SizedBox(height: 20.0),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Shipping",
//                           style: TextStyle(color: Colors.grey, fontSize: 20.0),
//                         ),
//                         Text("Freeship", style: TextStyle(fontSize: 20.0)),
//                       ],
//                     ),
//                     const SizedBox(height: 10.0),
//                     Container(
//                       height: 1.0,
//                       width: double.infinity,
//                       color: Colors.grey.shade300,
//                     ),
//                     const SizedBox(height: 10.0),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Total",
//                           style: TextStyle(color: Colors.grey, fontSize: 20.0),
//                         ),
//                         Text("\$110", style: TextStyle(fontSize: 20.0)),
//                       ],
//                     ),
//                     const SizedBox(height: 10.0),
//                     Container(
//                       height: 1.0,
//                       width: double.infinity,
//                       color: Colors.grey.shade300,
//                     ),
//                     const SizedBox(height: 10.0),
//                     Container(
//                       padding: EdgeInsetsDirectional.symmetric(
//                         vertical: 15.0,
//                         horizontal: 30.0,
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30.0),
//                         color: AppColorLight.containerCartColor,
//                       ),
//                       clipBehavior: Clip.antiAliasWithSaveLayer,
//                       child: Text(
//                         "Proceed to checkout",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 22.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20.0),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
