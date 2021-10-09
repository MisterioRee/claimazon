import 'package:cached_network_image/cached_network_image.dart';
import 'package:claimazon/components/custom_shimmer.dart';
import 'package:claimazon/components/product_card.dart';
import 'package:claimazon/models/Product.dart';
import 'package:claimazon/pages/product_details_page.dart';
import 'package:claimazon/services/product_service.dart';
import 'package:claimazon/theme/theme_colors.dart';
import 'package:claimazon/theme/theme_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProductsListPage extends StatelessWidget {
  final _ = Get.put(ProductsService());

  ProductsListPage() {
    _.initialFetch();
  }

  Widget _buildGridProduct(Product product) {
    return ProductCard(
      product: product,
      onTap: () {
        Get.to(() => ProductDetailsPage(
              product: product,
            ));
      },
    );
  }

  Widget _buildListProduct(Product product) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {},
              child: Card(
                child: SizedBox(
                  height: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: "${product.image}",
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CustomShimmer(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "${product.title}",
                      style: ThemeStyles.kTitleStyle,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  SizedBox(height: 4),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "${product.description}",
                      overflow: TextOverflow.clip,
                      maxLines: 3,
                      style: ThemeStyles.kMiniHint,
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${product.price}",
                          style: ThemeStyles.kLabelBold,
                        ),
                        FaIcon(
                          FontAwesomeIcons.heart,
                          color: ThemeColor.primeryColor,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: ThemeColor.primeryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Category Name",
          style: ThemeStyles.kLabelStyleWhite,
        ),
      ),
      body: GetBuilder<ProductsService>(
        builder: (__) => _.isLoading
            ? GridShimmer(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
              )
            : Column(
                children: [
                  Expanded(
                    flex: 9,
                    child: GridView.count(
                      controller: _.scrollController,
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      childAspectRatio: 0.7,
                      children: [
                        ..._.products.map((e) => _buildGridProduct(e)),
                      ],
                    ),
                  ),
                  if (_.isLoadingMore)
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: ThemeColor.primeryColor,
                        ),
                      ),
                    )
                ],
              ),
      ),
    );
  }
}
