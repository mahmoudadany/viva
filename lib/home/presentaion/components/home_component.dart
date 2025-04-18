import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva/core/utilies/app_constant.dart';
import 'package:viva/core/utilies/local_storage/get_storage.dart';
import 'package:viva/home/presentaion/controller/home_controller.dart';
import 'package:viva/home/presentaion/screens/display_item.dart';
import 'package:viva/home/presentaion/screens/order_screen.dart';
import 'package:viva/home/presentaion/screens/show_all_product.dart';


import '../../../core/globle/app_color/app_color_light.dart';

class HomeComponent extends GetWidget<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 10.0,
        bottom: 10.0,
      ),
      child: Obx(
        () =>
            controller.homeLoading.value
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                  child: Column(
                    children: [
                      Obx(
                        () => Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        controller.feMale.value
                                            ? AppColorLight.buttonColor
                                            : Colors.grey[300],
                                    child: Image.asset(
                                      'assets/icons/female.png',
                                      color:
                                          controller.feMale.value
                                              ? Colors.white
                                              : Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text("Female"),
                                ],
                              ),
                              onTap: () {
                                controller.feMale.value = true;
                                controller.male.value = false;
                                GetLocalStorage.write(AppConstant.genderState, AppConstant.female);
                                controller.getCustomProduct(GetLocalStorage.getGenderState());
                              },
                            ),
                            GestureDetector(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        controller.male.value
                                            ? AppColorLight.buttonColor
                                            : Colors.grey[300],
                                    child: Image.asset(
                                      'assets/icons/male.png',
                                      color:
                                          controller.male.value
                                              ? Colors.white
                                              : Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text("Male"),
                                ],
                              ),
                              onTap: () {
                                controller.male.value = true;
                                controller.feMale.value = false;
                                GetLocalStorage.write(AppConstant.genderState, AppConstant.male);
                                controller.getCustomProduct(GetLocalStorage.getGenderState());
                              },
                            ),
                            Container(
                              height: 60.0,
                              width: 2.0,
                              color: Colors.black,
                            ),
                            GestureDetector(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey[300],
                                    child: Image.asset(
                                      'assets/icons/all_product.png',
                                      width: 20.0,
                                      height: 20.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text("Products"),
                                ],
                              ),
                              onTap: () {
                                Get.to(ShowAllProduct(controller.allProduct));
                              },
                            ),
                            GestureDetector(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey[300],
                                    child: Image.asset(
                                      'assets/icons/endOrder.png',
                                      width: 25.0,
                                      height: 25.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text("Orders"),
                                ],
                              ),
                              onTap: () {
                                Get.to(OrderScreen());
                                },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      SizedBox(
                        height: 200,
                        width: 400,
                        child: FadeIn(
                          duration: Duration(milliseconds: 300),
                          child: CarouselSlider(
                            items: controller.allAd.map((e) =>
                                Container(
                              height: 200.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: AppColorLight.containerColor,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 20.0,
                                          backgroundColor: Colors.grey.shade300,
                                          child: Image(image: NetworkImage(e.companyImage),width: 25.0,height: 25.0,),
                                        ),
                                        const SizedBox(width: 10.0),
                                        Text(
                                          e.companyName,
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      // Image(
                                      //   image:NetworkImage(e.adImage),
                                      //   fit: BoxFit.cover,
                                      //   width: double.infinity,
                                      // ),
                                    child: CachedNetworkImage(
                                      imageUrl: e.adImage,width: double.infinity,fit: BoxFit.cover,
                                      errorWidget: (context, url, error) => Center(child: Icon(Icons.error_outline),),
                                    ),
                                  ),
                                  const SizedBox(height: 15.0,)
                                ],
                              ),
                            ),
                            ).toList(),
                            options: CarouselOptions(
                              height: 200,
                              autoPlay: true,
                              viewportFraction: 1.0,
                              autoPlayCurve: Curves.fastOutSlowIn,
                            ),
                          ),
                          // child: ListView.separated(
                          //   scrollDirection: Axis.horizontal,
                          //   itemCount: controller.allAd.length,
                          //   itemBuilder: (context, index) =>
                          //       Container(
                          //         height: 200.0,
                          //         width: 350,
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(15.0),
                          //           color: AppColorLight.containerColor,
                          //         ),
                          //         child: Column(
                          //           mainAxisAlignment: MainAxisAlignment.start,
                          //           crossAxisAlignment: CrossAxisAlignment.start,
                          //           children: [
                          //           Padding(
                          //             padding: const EdgeInsets.all(5.0),
                          //             child: Row(
                          //               children: [
                          //                 CircleAvatar(
                          //                   radius: 20.0,
                          //                   backgroundColor: Colors.grey.shade300,
                          //                   child: Image(image: NetworkImage(controller.allAd[index].companyImage),width: 25.0,height: 25.0,),
                          //                 ),
                          //                 const SizedBox(width: 10.0),
                          //                 Text(
                          //                   controller.allAd[index].companyName,
                          //                   style: TextStyle(fontSize: 20.0),
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //           Expanded(
                          //             child: Image(
                          //               image:NetworkImage(controller.allAd[index].adImage),
                          //               fit: BoxFit.cover,
                          //               width: double.infinity,
                          //             ),
                          //           ),
                          //                                     ],
                          //                                   ),
                          //       ),
                          //   separatorBuilder: (context, index) => const SizedBox(width: 10.0,),
                          // ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "future Products",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            child: const Text(
                              "Show all",
                              style: TextStyle(color: Colors.grey),
                            ),
                            onPressed: () {
                              Get.to(
                                ShowAllProduct(
                                  controller.featureProduct ,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                       SizedBox(
                          height: 220.0,
                          width: double.infinity,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder:
                                (context, index) => GestureDetector(
                                  onTap:
                                      () {
                                        Get.to(
                                        DisplayItem(
                                          controller.featureProduct[index],
                                        ),
                                      );
                                      },
                                  child: SizedBox(
                                    width: 150.0,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          height: 150.0,
                                          width: 150.0,
                                          child: Image(
                                            image: NetworkImage(
                                              controller
                                                  .featureProduct
                                                  [index]
                                                  .images[0],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10.0),
                                        Text(
                                          controller.featureProduct[index].title,
                                          maxLines: 1,
                                          style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 3.0),
                                        Text(
                                          '\$ ${controller.allProduct[index].price}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            separatorBuilder:
                                (context, index) => const SizedBox(width: 10.0),
                            itemCount: controller.featureProduct.length,
                          ),
                        ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Recommended",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            child: const Text(
                              "Show all",
                              style: TextStyle(color: Colors.grey),
                            ),
                            onPressed: () {
                              Get.to(ShowAllProduct(controller.customProduct));
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      SizedBox(
                        height: 220.0,
                        width: double.infinity,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder:
                              (context, index) => GestureDetector(
                            onTap:
                                () {
                                  Get.to(
                              DisplayItem(
                                controller.customProduct[index],
                              ),
                            );
                                },
                            child: SizedBox(
                              width: 150.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 150.0,
                                    width: 150.0,
                                    child: Image(
                                      image: NetworkImage(
                                        controller
                                            .customProduct
                                            [index]
                                            .images[0],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    controller.customProduct[index].title,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis
                                    ),
                                  ),
                                  const SizedBox(height: 3.0),
                                  Text(
                                    '\$ ${controller.allProduct[index].price}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          separatorBuilder:
                              (context, index) => const SizedBox(width: 10.0),
                          itemCount: controller.customProduct.length,
                        ),
                      ),
                      // SizedBox(
                      //   height: 70.0,
                      //   width: double.infinity,
                      //   child: Obx(()=>ListView.separated(
                      //       scrollDirection: Axis.horizontal,
                      //       itemBuilder:
                      //           (context, index) => GestureDetector(
                      //             onTap: () {
                      //               Get.to(DisplayItem(controller.customProduct[index]));
                      //             },
                      //             child: Row(
                      //               mainAxisAlignment: MainAxisAlignment.start,
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //               children: [
                      //                 SizedBox(
                      //                   height: 70.0,
                      //                   width: 70.0,
                      //                   child: Image(image: NetworkImage(controller.customProduct[index].images[0])),
                      //                 ),
                      //                 const SizedBox(width: 5.0),
                      //                 SizedBox(
                      //                   width: 120,
                      //                   child: Column(
                      //                     crossAxisAlignment:
                      //                         CrossAxisAlignment.start,
                      //                     mainAxisSize: MainAxisSize.min,
                      //                     children: [
                      //                       Text(
                      //                         controller.customProduct[index].title,
                      //                         style: const TextStyle(
                      //                           fontWeight: FontWeight.bold,
                      //                           overflow: TextOverflow.ellipsis,
                      //                         ),
                      //                         overflow: TextOverflow.ellipsis,
                      //                         maxLines: 1,
                      //                       ),
                      //                       const SizedBox(height: 3.0),
                      //                       Text(
                      //                         '\$ ${controller.customProduct[index].price}',
                      //                         style: const TextStyle(
                      //                           fontWeight: FontWeight.bold,
                      //                           fontSize: 25.0,
                      //                         ),
                      //                         overflow: TextOverflow.ellipsis,
                      //                         maxLines: 1,
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //       separatorBuilder:
                      //           (context, index) => const SizedBox(width: 10.0),
                      //       itemCount: controller.customProduct.length,
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 10.0),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     const Text(
                      //       "Top Collection",
                      //       style: TextStyle(
                      //         fontSize: 25.0,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //     TextButton(
                      //       child: const Text(
                      //         "Show all",
                      //         style: TextStyle(color: Colors.grey),
                      //       ),
                      //       onPressed: () {},
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(height: 10.0),
                      // SizedBox(
                      //   height: 70.0,
                      //   width: double.infinity,
                      //   child: ListView.separated(
                      //     scrollDirection: Axis.horizontal,
                      //     itemBuilder:
                      //         (context, index) => Row(
                      //           children: [
                      //             SizedBox(
                      //               height: 70.0,
                      //               width: 70.0,
                      //               child: Image.asset(
                      //                 'assets/images/onboarding1.png',
                      //               ),
                      //             ),
                      //             const SizedBox(width: 5.0),
                      //             Column(
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               mainAxisSize: MainAxisSize.min,
                      //               children: [
                      //                 Text(
                      //                   'Turtleneck sweater',
                      //                   style: TextStyle(
                      //                     fontWeight: FontWeight.bold,
                      //                   ),
                      //                   overflow: TextOverflow.ellipsis,
                      //                   maxLines: 1,
                      //                 ),
                      //                 const SizedBox(height: 3.0),
                      //                 Text(
                      //                   '\$ 39.99',
                      //                   style: TextStyle(
                      //                     fontWeight: FontWeight.bold,
                      //                     fontSize: 25.0,
                      //                   ),
                      //                   overflow: TextOverflow.ellipsis,
                      //                   maxLines: 1,
                      //                 ),
                      //               ],
                      //             ),
                      //           ],
                      //         ),
                      //     separatorBuilder:
                      //         (context, index) => const SizedBox(width: 10.0),
                      //     itemCount: 10,
                      //   ),
                      // ),
                    ],
                  ),
                ),
      ),
    );
  }
}
