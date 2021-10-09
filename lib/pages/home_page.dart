import 'package:claimazon/components/text_fields.dart';
import 'package:claimazon/pages/products_pages.dart';
import 'package:claimazon/theme/theme_colors.dart';
import 'package:claimazon/theme/theme_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _buildIcon({required String path, String? title}) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductsListPage());
      },
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            child: Image.asset('$path'),
          ),
          SizedBox(height: 6),
          Text(
            "${title ?? ''}",
            style: ThemeStyles.kTitleStyle,
          )
        ],
      ),
    );
  }

  Widget _verticalDivider({double? height}) {
    return Container(
      height: height ?? 50,
      width: 1,
      color: Colors.grey,
    );
  }

  _showFilters() {
    showModalBottomSheet(
        context: Get.context!,
        builder: (context) {
          return Container(
            color: Colors.grey[300],
            height: Get.height / 2,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RangeSlider(
                    min: 1,
                    max: 10000,
                    divisions: 1,
                    onChanged: (RangeValues values) {},
                    values: RangeValues(1, 1000),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _buildHeadRowBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 6,
            ),
            child: GestureDetector(
              onTap: () {},
              child: FaIcon(
                FontAwesomeIcons.thList,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 45,
              child: BoxTextFieldWithPrefix(
                hintText: "Search",
                label: "Search",
                onChange: () {},
                prefix: Icon(
                  Icons.search,
                  color: ThemeColor.primeryColor,
                ),
                keyboard: TextInputType.text,
                errorText: null,
                initialValue: "",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                _showFilters();
              },
              child: Icon(
                Icons.clear_all,
                color: Colors.white,
                size: 35,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _appBar(height) => PreferredSize(
        preferredSize: Size(Get.size.width, height + 30),
        child: Container(
          color: ThemeColor.primeryColor,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: <Widget>[
                  _buildHeadRowBox(),
                ],
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(AppBar().preferredSize.height) as PreferredSizeWidget?,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: _buildIcon(
                          path: 'assets/computer.png',
                          title: 'Computer Accessories'),
                    ),
                    _verticalDivider(),
                    Expanded(
                      child: _buildIcon(
                        path: 'assets/dress.png',
                        title: 'Appeal & clothing',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: _buildIcon(
                          path: 'assets/makeup.png',
                          title: 'Beauty & Products'),
                    ),
                    _verticalDivider(),
                    Expanded(
                      child: _buildIcon(
                        path: 'assets/smart-tv.png',
                        title: 'Appliances & Gadgets',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: _buildIcon(
                        path: 'assets/smartphone.png',
                        title: 'Smart Phones',
                      ),
                    ),
                    _verticalDivider(),
                    Expanded(
                      child: _buildIcon(
                        path: 'assets/football.png',
                        title: 'Sports',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: _buildIcon(
                        path: 'assets/home.png',
                        title: 'Home',
                      ),
                    ),
                    _verticalDivider(),
                    Expanded(
                      child: _buildIcon(
                        path: 'assets/rocking-horse.png',
                        title: 'Kids',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
