import 'package:cached_network_image/cached_network_image.dart';
import 'package:claimazon/models/Product.dart';
import 'package:claimazon/theme/theme_colors.dart';
import 'package:claimazon/theme/theme_styles.dart';
import 'package:claimazon/utilities/signature.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_shimmer.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final Function onTap;
  ProductCard({required this.product, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 180,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => onTap(),
                  child: SizedBox(
                    height: 120,
                    width: 180,
                    child: CachedNetworkImage(
                      imageUrl: "${product.thumbnail}",
                      fit: BoxFit.cover,
                      placeholder: (context, url) => CustomShimmer(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(),
                        Text(
                          "${product.title}",
                          style: ThemeStyles.kLabelStyle,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "${product.description}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: ThemeStyles.kMiniHint,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${Signature.getCurrencySign()}${product.price}",
                      style: ThemeStyles.kHintTextStyleWhiteBg,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: FaIcon(
                        // FontAwesomeIcons.solidHeart,
                        FontAwesomeIcons.heart,
                        color: ThemeColor.primeryColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
