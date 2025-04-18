import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva/check_out/presentaion/components/components.dart';
import 'package:viva/check_out/presentaion/controller/check_out_conttroller.dart';
import 'package:viva/core/globle/app_color/app_color_light.dart';
import 'package:viva/home/presentaion/controller/home_controller.dart';
import 'package:viva/home/presentaion/screens/home_screen.dart';

class CheckOutComponent extends GetWidget<CheckOutController>{
  @override
  Widget build(BuildContext context) {
    var form = GlobalKey<FormState>();
    return Theme(
      data: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.black, // Active step color
          surface: Colors.white, // Background color of Stepper
        ),
      ),
      child: Form(
        key: form,
        child: Obx(() =>  Stepper(
            elevation: 0,
            type: StepperType.horizontal,
            currentStep: controller.currentStep.value,
            onStepContinue: () {
              if(form.currentState!.validate()){
                if(controller.currentStep.value<=2){
                  if(controller.currentStep.value==0){

                    controller.total.value=controller.cartProductPrice.value+controller.delivery.value;
                  }

                  if(controller.currentStep.value==1 && CheckOutController.paymentState.value==false){
                    Get.snackbar("Payment Failure", "please complete payment method",snackPosition: SnackPosition.BOTTOM);
                    return;
                  }

                  if(controller.currentStep.value==2){
                    controller.currentStep.value==0;
                    HomeController.bottomBarIndex.value=0;
                    Get.off(HomeScreen());
                  }

                  controller.currentStep.value++;
                }else{
                  Get.snackbar("check out", "message",snackPosition: SnackPosition.BOTTOM);
                }
              }
            },
            onStepCancel: () {
              if(controller.currentStep.value>0){
                controller.currentStep.value--;
              }else{
                Get.snackbar("check out", "message",snackPosition: SnackPosition.BOTTOM);
              }
            },
            steps:
            [
              Step(
                title: const Text(""),
                isActive: controller.currentStep.value>=0,
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    const Text("step 1"),
                    const Text("Shipping",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10.0,),
                    checkOutTextField(
                      controller: controller.cityController,
                      hint: "City",
                      inputType: TextInputType.text,
                      validator: (value) {
                        if(value!.isEmpty){
                          return "please enter city name";
                        }
                        return null;
                      },
                      onChange: (value) {
                        controller.cityController.text=value;
                      },
                    ),
                    const SizedBox(height: 10.0,),
                    checkOutTextField(
                      controller: controller.streetNameController,
                      hint: "Street Name",
                      inputType: TextInputType.text,
                      validator: (value) {
                        if(value!.isEmpty){
                          return "please enter your street name";
                        }
                        return null;
                      },
                      onChange: (value) {
                        controller.streetNameController.text=value;
                      },
                    ),
                    const SizedBox(height: 10.0,),
                    checkOutTextField(
                      controller: controller.phoneNumberController,
                      hint: "Phone Number",
                      inputType: TextInputType.phone,
                      validator: (value) {
                        if(value!.isEmpty){
                          return "please enter your phone number";
                        }
                        if(value.length!=11){
                          return "phone number should have 11 number";
                        }
                        value[0];
                        if(value[0]=="0"&&value[1]=="1"){

                        }else{
                          return "phone number should start 01";
                        }
                        if(value[2]=="0"||value[2]=="1"||value[2]=="2"||value[2]=="5"){

                        }else{
                          return "phone number should start 01321321";
                        }
                        return null;
                      },
                      onChange: (value) {
                        controller.phoneNumberController.text=value;
                      },
                    ),
                    const SizedBox(height: 30.0,),
                    Text("Shipping Method",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 20.0,),
                    Obx(() => RadioMenuButton<int>(
                        value: 1,
                        groupValue: controller.selectedShipping.value,
                        onChanged: (value) {
                          controller.selectedShipping.value=value!;
                          controller.delivery.value=0;
                        },
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Row(
                              children:
                              [
                                Text("Free",style: TextStyle(fontSize: 18.0),),
                                SizedBox(width: 20.0,),
                                Text("Delivery to home",style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            Text("Delivery from 6 to 7 business days",style: TextStyle(color: Colors.grey),),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    Obx(() => RadioMenuButton<int>(
                        value: 2,
                        groupValue: controller.selectedShipping.value,
                        onChanged: (value) {
                          controller.selectedShipping.value=value!;
                          controller.delivery.value=25;

                        },
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Row(

                              children:
                              [
                                Text("\$ 5.00",style: TextStyle(fontSize: 18.0),),
                                SizedBox(width: 20.0,),
                                Text("Delivery to home",style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            Text("Delivery from 4 to 5 business days",style: TextStyle(color: Colors.grey),),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    Obx( () => RadioMenuButton<int>(
                        value: 7,
                        groupValue: controller.selectedShipping.value,
                        onChanged: (value) {
                          controller.selectedShipping.value=value!;
                          controller.delivery.value=50;

                        },
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Row(

                              children:
                              [
                                Text("\$ 7.00",style: TextStyle(fontSize: 18.0),),
                                SizedBox(width: 20.0,),
                                Text("Delivery to home",style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            Text("Delivery from 2 to 3 business days",style: TextStyle(color: Colors.grey),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Step(
                isActive: controller.currentStep.value>=1,
                title: const Text(""),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    const Text("step 1"),
                    const Text("Payment",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10.0,),
                    // Obx(
                    //   () => Row(
                    //     children:
                    //     [
                    //       Expanded(
                    //         child: GestureDetector(
                    //           child: Container(
                    //             padding: const EdgeInsetsDirectional.all(10.0),
                    //             decoration: BoxDecoration(
                    //               borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    //               color: controller.paymentMethod.value==0? Colors.grey : Colors.white,
                    //               boxShadow: const [
                    //                 BoxShadow(
                    //                   color: Colors.grey,
                    //                   spreadRadius: 2,
                    //                   blurRadius: 10,
                    //                   offset: Offset(4, 4),
                    //                 ),
                    //               ],
                    //
                    //             ),
                    //             child: Column(
                    //               children:
                    //               [
                    //                 Image.asset("assets/icons/cash.png",color: controller.paymentMethod.value==0? Colors.white : Colors.grey,),
                    //                 const SizedBox(height: 5.0,),
                    //                 Text(
                    //                   "Cash",
                    //                   style: TextStyle(
                    //                     color: controller.paymentMethod.value==0? Colors.white : Colors.black,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //           onTap: () {
                    //             controller.paymentMethod.value=0;
                    //           },
                    //         ),
                    //       ),
                    //       const SizedBox(width: 10.0,),
                    //       Expanded(
                    //         child: GestureDetector(
                    //           child: Container(
                    //             padding: const EdgeInsetsDirectional.all(10.0),
                    //             decoration:  BoxDecoration(
                    //               borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    //               color: controller.paymentMethod.value==1? Colors.grey : Colors.white,
                    //               boxShadow: const [
                    //                 BoxShadow(
                    //                   color: Colors.grey,
                    //                   spreadRadius: 2,
                    //                   blurRadius: 10,
                    //                   offset: Offset(4, 4),
                    //                 ),
                    //               ],
                    //
                    //             ),
                    //             child: Column(
                    //               children:
                    //               [
                    //                 Image.asset("assets/icons/credit_card_Icon.png",color: controller.paymentMethod.value==1? Colors.white : Colors.grey,),
                    //                 const SizedBox(height: 5.0,),
                    //                 Text(
                    //                   "Credit Card",
                    //                   style: TextStyle(
                    //                     color: controller.paymentMethod.value==1? Colors.white : Colors.black,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //           onTap: () {
                    //             controller.paymentMethod.value=1;
                    //           },
                    //         ),
                    //       ),
                    //       const SizedBox(width: 10.0,),
                    //       Expanded(
                    //         child: GestureDetector(
                    //           child: Container(
                    //             padding: const EdgeInsetsDirectional.all(10.0),
                    //             decoration: BoxDecoration(
                    //               borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    //               color: controller.paymentMethod.value==2? Colors.grey :Colors.white,
                    //               boxShadow: const [
                    //                  BoxShadow(
                    //                   color: Colors.grey,
                    //                   spreadRadius: 2,
                    //                   blurRadius: 10,
                    //                   offset: Offset(4, 4),
                    //                 ),
                    //               ],
                    //
                    //             ),
                    //             child: Column(
                    //               children:
                    //               [
                    //                 Image.asset("assets/icons/vodafone.png",color: controller.paymentMethod.value==2? Colors.white : Colors.grey,),
                    //                 const SizedBox(height: 5.0,),
                    //                 Text(
                    //                   "VCash",
                    //                   style: TextStyle(
                    //                     color: controller.paymentMethod.value==2? Colors.white : Colors.black,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //           onTap: () {
                    //             controller.paymentMethod.value=2;
                    //           },
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(height: 10.0,),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children:
                    //   [
                    //     const Text(
                    //       "Choose your card",
                    //       style: TextStyle(
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //     TextButton(
                    //       child: const Text(
                    //         "Add new+",
                    //         style: TextStyle(
                    //           fontSize: 12,
                    //           color: Colors.red
                    //         ),
                    //       ),
                    //       onPressed: () {
                    //
                    //       },
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 10.0,),
                    Container(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Product Price",
                                  style: TextStyle(color: Colors.grey, fontSize: 14.0),
                                ),
                                Obx(()=> Text("\$${controller.cartProductPrice.value}", style: TextStyle(fontSize: 14.0))),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Container(
                              height: 1.0,
                              width: double.infinity,
                              color: Colors.grey.shade300,
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Delivery",
                                  style: TextStyle(color: Colors.grey, fontSize: 14.0),
                                ),
                                Text(controller.delivery.value.toString(), style: TextStyle(fontSize: 14.0)),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Container(
                              height: 1.0,
                              width: double.infinity,
                              color: Colors.grey.shade300,
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total",
                                  style: TextStyle(color: Colors.grey, fontSize: 14.0),
                                ),
                                Obx(()=> Text("\$${controller.total.value}", style: TextStyle(fontSize: 14.0))),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Container(
                              height: 1.0,
                              width: double.infinity,
                              color: Colors.grey.shade300,
                            ),
                            const SizedBox(height: 10.0),
                            GestureDetector(
                              child: Container(
                                padding: EdgeInsetsDirectional.symmetric(
                                  vertical: 10.0,
                                  horizontal: 30.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: AppColorLight.containerCartColor,
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Text(
                                  "Go To Pay ${controller.total.value} EGP",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              onTap: () {
                                // Get.to(CheckOutScreen(controller.cartItems));
                                // StripeManager.paymentIn(controller.total.value, "EGP",context);
                              },
                            ),
                            const SizedBox(height: 5.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

              ),
              Step(
                  title: Text(""),
                  isActive: controller.currentStep.value>=2,
                  content: Column(
                    children: [
                      const Text(
                        "Order Completed",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 40.0,),
                      Image.asset('assets/images/order.png'),
                      const SizedBox(height: 40.0,),
                      const Text(
                        textAlign: TextAlign.center,
                        "thank your for your purchase \n you can view your order in my orders \n section",
                        style: TextStyle(
                          fontSize: 14.0
                        ),
                      ),
                      const SizedBox(height: 40.0,),
                    ],
                  ),
                  state: StepState.complete
              )
            ],

          ),
        ),
      ),
    );
  }

}