import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva/auth/presentation/controller/auth_controller.dart';
import 'package:viva/core/utilies/app_constant.dart';
import 'package:viva/core/utilies/local_storage/get_storage.dart';
import 'package:viva/home/presentaion/controller/home_controller.dart';

class AccountComponent extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Row(
              children: [
                // CircleAvatar(
                //   radius: 40.0,
                //   backgroundColor: Colors.grey.shade300,
                //   backgroundImage: NetworkImage(
                //     !GetLocalStorage.getUser()!.picture!.isEmpty? GetLocalStorage.getUser()!.picture!:"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAclBMVEX///8AAAAwMDD39/fe3t78/PwtLS3l5eXJycnNzc21tbXZ2dnx8fFsbGw9PT02NjaHh4dYWFh7e3tnZ2eQkJClpaVhYWFHR0dCQkJ9fX2xsbEeHh69vb3ExMTT09NTU1MaGhpycnILCwuampoSEhIcHBx1HLI5AAAFF0lEQVR4nO3dCXraMBAFYIQxGEJYEpaQjRDa+1+xTShNTG2wRk/Mkzv/CfQ+sDVa3ekYY4wxxhhjjDHGGGOMMcb8X8bFaHG7nUy73e50sr1djIqxdpNw8t5y5aqslr1cu3EAN7N+ZbyDp9mNdgPD5I8PZ+IdTJYJ/5DL94v5PrzvE8343CjewUi7sQKDuUdA5+YD7Qb7Gnnl+/Co3WQ/d94BnbvTbrSHzO8fejTPtBveVLYWBXRunUrEy31gnUka3cZWHNC5rXbjm9gEBHRuo938y/y7iTL6TmMQGNA59q5f+hr9staOcN5jcEDy/2n2BEj4xtwrLgABnVtox6iXQQI6x/sjLkEJl9pBav0AJfyhHaTOEBTQuaF2lBph9dp3O+0oNbqwhH3tKNV6sIDOcc6iIuqZI863qWRupg7ngyibnKlGORLOp8CEfcayZvwGTOgY197GqIqGNiFk5HT0zpgwnwATUj6H0Hcp51TGLTDhvXaYSu3v8TFTGAcz7TCV2l+XFsCEz9phKt0AE75qh6nU/vHhoNnekkY4Fy/yc5uf/DxRljSdDq5sm2pHqRGy+Fv2oB2lBq5sW2lHqTGDJeQs2v6H3xA3UdPn3HXS/poGObbg3HTS+jF+hitpSIsam0300v7ZxCnjv7RzD0zI2eW3fyYKt1HBuUI7TKVx68f4gH2JRxPtKDVwDyLrzjbcg8j5GP4GS6gdpNYOFJBz5ekDal7/RTtIPcwon3TP1yfM8hPnwtMf8gNBX6ackzR/IDoM2q7ioPpcuo+5doQLwn9E4hfpQXBC7QAXhS7PUM6ylYSW36xF9xefU/hV+E/mjwMTko59v8kCt5lSTrKVhfWIlNufT4Stk3IuyZS9BCXk3AxVFnYSmP9F0wnbdMK6zaQs5EFM4TEMK77py+6DgITUg98v8u3QrPtoTr2KE7KeHf2HdMqtq93wxqRTbtS3KZQIj7FxT7KVyQaJKVRsf0nW9HlXK6rkgoQJ/Uc/+G/j49yef4bvHRnUixXV/DbypTC2P+X3P+XcUHqBT6fIvGRYz2dumHMP1CU+N7elU69957Oqn8jI94TPqyaZYVOJz2m9JF+lXgmTK2g++UycWkJOltAS8mt/wvb3hz4Tw+Q7vWr4LJUmNc32l8+8cIJzGB2/BZq0ZhKPfnokfE9sKvGT32TbXru5/nxXgvl3e5Xl/hv4doyHKuuMl6LzpLOedsMbKu7Fh9i2I/4fchh6p9lqRLx3LxtuIEcQV5y/ZF7cAQ/k3z+zhRxukGfVP62IatUe7mKasruCodQZ7JHn8E+9aX89MBshr/uo9rDUeyRfd9HjHcxVljWEdYvU4tpba4fI61ibmb9c77WTP8Z8udTr76/zRI5j9Q1N7OIX56/X/3uWzeNOyxXxO4fL1vGKnULn8ftXN07GIeIUM0of30P2wg/4Ym2x5Vyu+f6sswEOlV+gF5XhoB7HDPeVI7RbyM84YHmDVukDKgDkjZYxBO81kp8OuZbAGif8s6Lxhf1Rcdc7xxN0cXTYiddrCek02AqZaiF7xLXb3lD7E8r7feT3HGKSF+HIr47EJB9Khd5Tci3ylyny2zgxyXf677Wb3pB8IwfjuLeK/DwK8itcMckPuSNvd45JvmeMYXa0CXnZhrsYOC75DWhMM6TnyMdPzDM038mvjkZ+/zYm+b09uE+JxyW/TwP5TY6Y5Gds1/1uCvr8t0kaY4wxxhhjjDHGGGOMMcb89guWJ1UqkABfzwAAAABJRU5ErkJggg==",
                //   ),
                // ),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      GetLocalStorage.getUser()?.name ?? "userName".tr,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      GetLocalStorage.getUser()?.email ?? "userEmailAddress".tr,
                      maxLines: 1,
                      style: TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
                const SizedBox(width: 10.0),
              ],
            ),
          ),
          const SizedBox(height: 40.0),
          Container(
            height: 300,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(4, 4),
                ),
              ],
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 1.0,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("arabic".tr, style: TextStyle(fontSize: 18.0)),
                    Obx(
                      () => Switch(
                        value: controller.isArabic.value,
                        onChanged: (value) {
                          if (!controller.isArabic.value) {
                            Get.updateLocale(Locale("ar"));
                            GetLocalStorage.write(AppConstant.langState, "ar");
                          } else {
                            Get.updateLocale(Locale("en"));
                            GetLocalStorage.write(AppConstant.langState, "en");
                          }
                          controller.isArabic.value = value;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Container(
                  height: 1.0,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(height: 10.0),
                Container(
                  height: 1.0,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(height: 5.0),
                Center(
                  child: TextButton(
                    onPressed: () {
                      AuthController.signOut();
                    },
                    child: Text("logOut".tr, style: TextStyle(fontSize: 18.0)),
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  height: 1.0,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
