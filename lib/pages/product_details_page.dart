import 'package:cached_network_image/cached_network_image.dart';
import 'package:claimazon/components/custom_shimmer.dart';
import 'package:claimazon/models/Product.dart';
import 'package:claimazon/theme/theme_colors.dart';
import 'package:claimazon/theme/theme_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;
  const ProductDetailsPage({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: "${product.image}",
            fit: BoxFit.cover,
            placeholder: (context, url) => CustomShimmer(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(height: 10),
          Text(
            "${product.title}",
            style: ThemeStyles.kBigTitleStyle,
          ),
          Text(
            "${product.price}",
            style: ThemeStyles.kBigTitleStyle,
          ),
          Divider(),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemSize: 20,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    // print(rating);
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Text(
                    "Reviews ${product.reviews.length}",
                    style: ThemeStyles.kMiniHint,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Text(
            "Description:",
            style: ThemeStyles.kLabelBold,
          ),
          Text(
            "${product.description}",
          ),
        ],
      )),
    );
  }
}
