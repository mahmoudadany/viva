import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva/check_out/data/data_source/stripe_payment/stripe_manager.dart';
import 'package:viva/check_out/presentaion/components/components.dart';
import 'package:viva/check_out/presentaion/controller/check_out_conttroller.dart';
import 'package:viva/check_out/presentaion/screens/check_out_screen.dart';
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
        child: Obx(() => Stepper(
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
                    Text("step1".tr),
                    Text("shipping".tr,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10.0,),
                    checkOutTextField(
                      controller: controller.cityController,
                      hint: "city".tr,
                      inputType: TextInputType.text,
                      validator: (value) {
                        if(value!.isEmpty){
                          return "cityEmpty".tr;
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
                      hint: "street".tr,
                      inputType: TextInputType.text,
                      validator: (value) {
                        if(value!.isEmpty){
                          return "streetEmpty".tr;
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
                      hint: "phoneNumber".tr,
                      inputType: TextInputType.phone,
                      validator: (value) {
                        if(value!.isEmpty){
                          return "phoneNumberEmpty".tr;
                        }
                        if(value.length!=11){
                          return "phoneNumberLength".tr;
                        }
                        value[0];
                        if(value[0]=="0"&&value[1]=="1"){

                        }else{
                          return "phoneNumber01".tr;
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
                    Text("shippingMethod".tr,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 20.0,),
                    Obx(() => RadioMenuButton<int>(
                        value: 1,
                        groupValue: controller.selectedShipping.value,
                        onChanged: (value) {
                          controller.selectedShipping.value=value!;
                          controller.delivery.value=0;
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Row(
                              children:
                              [
                                Text("free".tr,style: TextStyle(fontSize: 18.0),),
                                SizedBox(width: 20.0,),
                                Text("delivery".tr,style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            Text("delivery67".tr,style: TextStyle(color: Colors.grey),),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Row(

                              children:
                              [
                                Text("25 EGP",style: TextStyle(fontSize: 18.0),),
                                SizedBox(width: 20.0,),
                                Text("delivery".tr,style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            Text("delivery45".tr,style: TextStyle(color: Colors.grey),),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Row(

                              children:
                              [
                                Text("50 EGP",style: TextStyle(fontSize: 18.0),),
                                SizedBox(width: 20.0,),
                                Text("delivery".tr,style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            Text("delivery23".tr,style: TextStyle(color: Colors.grey),),
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
                    Text("step2".tr),
                    Text("payment".tr,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10.0,),
                    const SizedBox(height: 10.0,),

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
                                  "productPrice".tr,
                                  style: TextStyle(color: Colors.grey, fontSize: 14.0),
                                ),
                                Obx(()=> Text("${controller.cartProductPrice.value} EGP", style: TextStyle(fontSize: 14.0))),
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
                                  "delivery".tr,
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
                                  "total".tr,
                                  style: TextStyle(color: Colors.grey, fontSize: 14.0),
                                ),
                                Obx(()=> Text("${controller.total.value} EGP", style: TextStyle(fontSize: 14.0))),
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
                                  "${"goToPay".tr} ${controller.total.value} EGP",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              onTap: () {
                                controller.payment(controller.total.value, "EGP",context);
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
                      Text(
                        "orderCompleted".tr,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 40.0,),
                      Image.asset('assets/images/order.png'),
                      const SizedBox(height: 40.0,),
                      Text(
                        textAlign: TextAlign.center,
                        "thank".tr,
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