import 'dart:convert';

import 'package:claimazon/models/Product.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductsService extends GetxController {
  bool isLoading = false;
  List<Product> products = [];

  _setLoadingStatus(bool status) {
    this.isLoading = status;
    update();
  }

  Future<void> fetchProducts() async {
    _setLoadingStatus(true);
    try {
      final String response =
          await rootBundle.loadString('assets/mock/sample.json');
      final data = await json.decode(response);
      this.products = List<Product>.from(
        data.map((data) => Product.fromJson(data)),
      );
      await Future.delayed(const Duration(milliseconds: 3000), () {});
    } catch (e) {
      print(e);
    }
    _setLoadingStatus(false);
  }
}
