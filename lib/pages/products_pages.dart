import 'package:cached_network_image/cached_network_image.dart';
import 'package:claimazon/components/custom_shimmer.dart';
import 'package:claimazon/models/Product.dart';
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
                  onTap: () {},
                  child: SizedBox(
                    height: 120,
                    width: 180,
                    child: CachedNetworkImage(
                      imageUrl: "${product.image}",
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
                      "\$${product.price}",
                      style: ThemeStyles.kHintTextStyle,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: FaIcon(
                        FontAwesomeIcons.solidHeart,
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
                  if (!_.isLoadingMore)
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
