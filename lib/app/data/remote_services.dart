import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:faky_shop/app/home/model/product_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  Future<Either<String, List<ProductModel>>> fetchData() async {
    const productUrl = "https://fakestoreapi.com/products";

    try {
      final response = await http.get(Uri.parse(productUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        final productData = data.map((e) => ProductModel.fromJson(e)).toList();
        print("product Data === $productData");
        return Right(productData);
      } else {
        return const Left("Something went wrong!");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
