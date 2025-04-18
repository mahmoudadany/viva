import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva/home/presentaion/controller/home_controller.dart';



class SearchComponent extends GetWidget<HomeController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:
          [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey.shade200
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search_outlined,size: 25.0,)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
