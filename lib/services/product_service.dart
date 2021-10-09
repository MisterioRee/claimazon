import 'dart:convert';

import 'package:claimazon/controller/http_controller.dart';
import 'package:claimazon/models/Product.dart';
import 'package:claimazon/utilities/server.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class ProductsService extends GetxController {
  List<Product> products = [];

  bool isLoading = false;
  static const _pageSize = 10;
  int _currentPage = 1;
  bool isLoadingMore = false;
  bool haveMoreData = true;

  late ScrollController scrollController;

  _setLoadingStatus(bool status) {
    this.isLoading = status;
    update();
  }

  _setLoadingMore(bool status) {
    isLoadingMore = status;
    update();
  }

  Future<void> fetchPage() async {
    if (haveMoreData && !isLoadingMore) {
      _setLoadingMore(true);
      this._currentPage++;
      final newItems = await fetchProducts(page: _currentPage);
      final isLastPage = newItems.length < _pageSize;
      this.products.addAll(newItems);
      if (isLastPage) {
        haveMoreData = false;
      }
      _setLoadingMore(false);
    }
  }

  Future<void> initialFetch() async {
    _setLoadingStatus(true);
    this.products = await fetchProducts();
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    _setLoadingStatus(false);
  }

  Future<List<Product>> fetchProducts({int page = 1}) async {
    List<Product> _products = List<Product>.empty(growable: true);
    try {
      var finalUrl = Endpoint.products + "page=$page&limit=$_pageSize";
      var response = await HttpController.get(url: finalUrl);
      if (response.statusCode == HttpStatus.ok) {
        var decodedData = json.decode(response.body);
        _products = List<Product>.from(
          decodedData.map((data) => Product.fromJson(data)),
        );
      }
    } catch (e) {
      //TODO: set error messages accordingly
    }
    return _products;
  }

  Future<void> getSampleProducts() async {
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
      //TODO: set error messages accordingly
    }
    _setLoadingStatus(false);
  }

  @override
  void onInit() {
    super.onInit();
    this.scrollController = new ScrollController()..addListener(fetchPage);
  }
}
