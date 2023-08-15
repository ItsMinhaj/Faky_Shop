import 'package:faky_shop/app/home/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Faky Shop",
          style: GoogleFonts.monofett(fontSize: 48, color: Colors.deepOrange),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Obx(
            () {
              return Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: productController.productList.length,
                  itemBuilder: ((context, index) {
                    final product = productController.productList;
                    return Container(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image.network(
                              product[index].image.toString(),
                              height: 80,
                              width: double.infinity,
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Text(product[index].title.toString())),
                        ],
                      ),
                    );
                  }),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
