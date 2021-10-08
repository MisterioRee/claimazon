import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final Color? baseColor;
  final Color? highlightColor;
  CustomShimmer({this.baseColor, this.highlightColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Shimmer.fromColors(
        baseColor: baseColor ?? Colors.white70,
        highlightColor: highlightColor ?? Colors.white10,
        child: Column(
          children: [
            Container(
              width: Get.size.width,
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridShimmer extends StatelessWidget {
  final Color? baseColor;
  final Color? highlightColor;
  GridShimmer({this.baseColor, this.highlightColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Shimmer.fromColors(
        baseColor: baseColor ?? Colors.white70,
        highlightColor: highlightColor ?? Colors.white10,
        child: GridView.count(
          crossAxisCount: 12,
          children: List.generate(300, (index) {
            return Container(
              child: Card(
                color: Colors.blue,
              ),
            );
          }),
        ),
      ),
    );
  }
}
