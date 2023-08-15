import 'package:faky_shop/app/data/remote_services.dart';
import 'package:faky_shop/app/home/model/product_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final isLoading = false.obs;
  final productList = <ProductModel>[].obs;

  Future<void> fetchProducts() async {
    isLoading(true);
    final data = await RemoteServices().fetchData();
    data.fold(
        (error) => Fluttertoast.showToast(
              msg: error.toString(),
            ), (products) {
      productList.value = products;
      return productList;
    });
  }

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }
}
