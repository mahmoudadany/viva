import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:viva/home/presentaion/controller/home_controller.dart';

import 'display_item.dart';

class ShowAllOrderProduct extends GetWidget<HomeController> {
  List<dynamic> wearProducts;

  ShowAllOrderProduct(this.wearProducts);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${"found".tr} \n ${wearProducts.length} ${"results".tr}"),
            const SizedBox(height: 10.0),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: wearProducts.length,
                itemBuilder:
                    (context, index) => GestureDetector(
                      onTap: () {
                        Get.to(DisplayItem(wearProducts[index]));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Container(
                              alignment: AlignmentDirectional.center,
                              width: double.infinity,
                              child: Image(
                                image: NetworkImage(
                                  wearProducts[index]["images"][0],
                                ),
                                width: 130,
                                height: 130,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            wearProducts[index]["title"],
                            style: TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 3.0),
                          Text(
                            '\$ ${wearProducts[index]["price"]}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
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
