import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:viva/core/utilies/app_constant.dart';
import 'package:viva/home/presentaion/controller/home_controller.dart';

import '../../../core/globle/app_color/app_color_light.dart' show AppColorLight;
import '../../domain/entities/Product.dart';

class DisplayItem extends GetWidget<HomeController> {
  Product product;
  DisplayItem(this.product, {super.key});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getSimilarProduct(product.mainCategory);
    },);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FadeIn(
              duration: Duration(milliseconds: 500),
              child: CarouselSlider(
                items:
                    product.images
                        .map(
                          (e) => Stack(
                            children: [
                              // ShaderMask(
                              //   shaderCallback: (bounds) => LinearGradient(
                              //       begin: Alignment.topCenter,
                              //       end: Alignment.bottomCenter,
                              //       colors:
                              //       [
                              //         Colors.transparent,
                              //         Colors.black,
                              //         Colors.black,
                              //         Colors.transparent,
                              //       ]).createShader(bounds),
                              //   blendMode: BlendMode.dstIn,
                              //   child: CachedNetworkImage(
                              //     height: 550.0,
                              //     width: double.infinity,
                              //     fit: BoxFit.cover,
                              //     imageUrl: e,
                              //   )
                              //
                              // ),
                              CachedNetworkImage(
                                height: 350.0,
                                width: double.infinity,
                                fit: BoxFit.fitHeight,
                                imageUrl: e,
                              ),
                            ],
                          ),
                        )
                        .toList(),
                options: CarouselOptions(
                  height: 350,
                  viewportFraction: 1.0,
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 30.0,
                  end: 30.0,
                  top: 30.0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              product.title,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 18.0,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.end,
                              "\$ ${product.price}",
                              style: const TextStyle(
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          RatingBar.builder(
                            minRating: 1,
                            maxRating: 5,
                            itemCount: 5,
                            initialRating: 3,
                            itemPadding: const EdgeInsetsDirectional.only(
                              end: 5.0,
                            ),
                            itemSize: 22.0,
                            direction: Axis.horizontal,
                            itemBuilder:
                                (context, index) => const Icon(
                                  Icons.star,
                                  color: AppColorLight.ratingStarColor,
                                ),
                            onRatingUpdate: (value) {},
                          ),
                          const SizedBox(width: 5.0),
                          Text("(36)"),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Colors"),
                              SizedBox(
                                height: 50.0,
                                width: 120.0,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (context, index) {
                                        // List colors=[];
                                        // product.colors.forEach((value) {
                                        //   colors.add(value);
                                        // },);
                                        return SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: Obx(
                                          () =>  GestureDetector(
                                            child: Container(
                                              padding: EdgeInsets.all(3), // Space for border
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: controller.colorSelected.value==index
                                                    ? Border.all(color: Colors.black, width: 3)
                                                    : null,
                                              ),
                                              child: CircleAvatar(
                                                backgroundColor: Color(AppConstant.commonColors[product.colors[index]]!),

                                              ),
                                            ),
                                            onTap: () {
                                              controller.colorSelected.value=index;
                                            },
                                          ),
                                        ),
                                      );
                                      },
                                  separatorBuilder:
                                      (context, index) =>
                                          const SizedBox(width: 10.0),
                                  itemCount: product.colors.length,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Size"),
                              SizedBox(
                                height: 50.0,
                                width: 120.0,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (context, index) => SizedBox(
                                        height: 30.0,
                                        width: 30.0,
                                        child: Obx(
                                          () => GestureDetector(
                                            child: CircleAvatar(
                                              backgroundColor: controller.sizeSelected.value==product.size[index].toString()? AppColorLight.buttonColor:Colors.grey,
                                              child: Text(
                                                product.size[index].toString(),
                                                style: TextStyle(
                                                  color: controller.sizeSelected.value==product.size[index].toString()? Colors.white:Colors.black
                                                ),
                                              ),
                                            ),
                                            onTap: () {
                                              controller.sizeSelected.value=product.size[index];
                                            },
                                          ),
                                        ),
                                      ),
                                  separatorBuilder:
                                      (context, index) =>
                                          const SizedBox(width: 10.0),
                                  itemCount: product.size.length,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Obx(
                            () => AnimatedRotation(
                              turns:
                                  controller.visibleDescription.value
                                      ? 0.75
                                      : 0.50,
                              duration: Duration(milliseconds: 200),
                              child: IconButton(
                                onPressed: () {
                                  controller.visibleDescription.value =
                                      !controller.visibleDescription.value;
                                },
                                icon: Icon(Icons.arrow_back_ios_new_outlined),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 1.0,
                        width: double.infinity,
                        color: Colors.grey.shade300,
                      ),
                      Obx(
                        () => Visibility(
                          visible: controller.visibleDescription.value,
                          child: Text(
                            product.description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Similar Product",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Obx(
                            () => AnimatedRotation(
                              turns:
                                  controller.visibleSimilarProduct.value
                                      ? 0.75
                                      : 0.50,
                              duration: Duration(milliseconds: 200),
                              child: IconButton(
                                onPressed: () {
                                  controller.visibleSimilarProduct.value =
                                      !controller.visibleSimilarProduct.value;
                                },
                                icon: Icon(Icons.arrow_back_ios_new_outlined),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 1.0,
                        width: double.infinity,
                        color: Colors.grey.shade300,
                      ),
                      Obx(
                        () => Visibility(
                          visible: controller.visibleSimilarProduct.value,
                          child: FadeIn(
                            duration: Duration(milliseconds: 300),
                            child: SizedBox(
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
                                              controller
                                                  .similarProduct[index],
                                            ),
                                          );
                                          },
                                      child: SizedBox(
                                        width: 150,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              height: 150.0,
                                              width: 150.0,
                                              child: Image(
                                                image: NetworkImage(
                                                  controller
                                                      .similarProduct[index]
                                                      .images[0],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10.0),
                                            Text(
                                              controller
                                                  .similarProduct[index]
                                                  .title,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 12.0
                                              ),
                                            ),
                                            const SizedBox(height: 3.0),
                                            Text(
                                              '\$ ${controller.similarProduct[index].price}',
                                              maxLines: 1,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                separatorBuilder:
                                    (context, index) =>
                                        const SizedBox(width: 10.0),
                                itemCount: controller.similarProduct.length,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Reviews",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Obx(
                            () => AnimatedRotation(
                              turns:
                                  controller.visibleReviews.value ? 0.75 : 0.50,
                              duration: Duration(milliseconds: 200),
                              child: IconButton(
                                onPressed: () {
                                  controller.visibleReviews.value =
                                      !controller.visibleReviews.value;
                                },
                                icon: Icon(Icons.arrow_back_ios_new_outlined),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 1.0,
                        width: double.infinity,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 5.0),
                      Obx(
                        () => Visibility(
                          visible: controller.visibleReviews.value,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "4",
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Text('OUT OF 5'),
                                  Expanded(child: const SizedBox()),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      RatingBar.builder(
                                        minRating: 1,
                                        maxRating: 5,
                                        itemCount: 5,
                                        itemSize: 25.0,
                                        direction: Axis.horizontal,
                                        itemBuilder:
                                            (context, index) => Icon(
                                              Icons.star,
                                              color:
                                                  AppColorLight.ratingStarColor,
                                            ),
                                        onRatingUpdate: (value) {},
                                      ),
                                      const SizedBox(height: 3.0),
                                      Text(
                                        '83 ratings ',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('5'),
                                  const SizedBox(width: 5.0),
                                  Icon(
                                    Icons.star,
                                    color: AppColorLight.ratingStarColor,
                                    size: 25.0,
                                  ),
                                  const SizedBox(width: 5.0),
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      // valueColor: AlwaysStoppedAnimation<Color>(AppColorLight.ratingStarColor),
                                      color: AppColorLight.ratingStarColor,
                                      value: product.ratings["5"]/100,
                                      backgroundColor: Colors.grey.shade300,
                                    ),
                                  ),
                                  const SizedBox(width: 5.0),
                                  Text('${product.ratings["5"]}%'),
                                ],
                              ),
                              const SizedBox(height: 5.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('4'),
                                  const SizedBox(width: 5.0),
                                  Icon(
                                    Icons.star,
                                    color: AppColorLight.ratingStarColor,
                                    size: 25.0,
                                  ),
                                  const SizedBox(width: 5.0),
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      // valueColor: AlwaysStoppedAnimation<Color>(AppColorLight.ratingStarColor),
                                      color: AppColorLight.ratingStarColor,
                                      value: product.ratings["4"]/100,
                                      backgroundColor: Colors.grey.shade300,
                                    ),
                                  ),
                                  const SizedBox(width: 5.0),
                                  Text('${product.ratings["4"]}%'),
                                ],
                              ),
                              const SizedBox(height: 5.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('3'),
                                  const SizedBox(width: 5.0),
                                  Icon(
                                    Icons.star,
                                    color: AppColorLight.ratingStarColor,
                                    size: 25.0,
                                  ),
                                  const SizedBox(width: 5.0),
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      // valueColor: AlwaysStoppedAnimation<Color>(AppColorLight.ratingStarColor),
                                      color: AppColorLight.ratingStarColor,
                                      value: product.ratings["3"]/100,
                                      backgroundColor: Colors.grey.shade300,
                                    ),
                                  ),
                                  const SizedBox(width: 5.0),
                                  Text('${product.ratings["3"]}%'),
                                ],
                              ),
                              const SizedBox(height: 5.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('2'),
                                  const SizedBox(width: 5.0),
                                  Icon(
                                    Icons.star,
                                    color: AppColorLight.ratingStarColor,
                                    size: 25.0,
                                  ),
                                  const SizedBox(width: 5.0),
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      // valueColor: AlwaysStoppedAnimation<Color>(AppColorLight.ratingStarColor),
                                      color: AppColorLight.ratingStarColor,
                                      value: product.ratings["2"]/100,
                                      backgroundColor: Colors.grey.shade300,
                                    ),
                                  ),
                                  const SizedBox(width: 5.0),
                                  Text('${product.ratings["2"]}%'),
                                ],
                              ),
                              const SizedBox(height: 5.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('1'),
                                  const SizedBox(width: 5.0),
                                  Icon(
                                    Icons.star,
                                    color: AppColorLight.ratingStarColor,
                                    size: 25.0,
                                  ),
                                  const SizedBox(width: 5.0),
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      // valueColor: AlwaysStoppedAnimation<Color>(AppColorLight.ratingStarColor),
                                      color: AppColorLight.ratingStarColor,
                                      value: product.ratings["1"]/100,
                                      backgroundColor: Colors.grey.shade300,
                                    ),
                                  ),
                                  const SizedBox(width: 5.0),
                                  Text('${product.ratings["1"]}%'),
                                ],
                              ),
                              const SizedBox(height: 5.0),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  controller.cartProduct = product;
                  controller.addToCart(product,product.colors[controller.colorSelected.value]);
                },
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: AppColorLight.containerCartColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_bag, color: Colors.white, size: 30.0),
                      const SizedBox(width: 10.0),
                      Text(
                        "Add To Cart",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
