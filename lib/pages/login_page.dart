import 'package:claimazon/components/buttons.dart';
import 'package:claimazon/components/checkBoxes.dart';
import 'package:claimazon/components/custom_shimmer.dart';
import 'package:claimazon/components/text_fields.dart';
import 'package:claimazon/pages/home_page.dart';
import 'package:claimazon/theme/theme_colors.dart';
import 'package:claimazon/theme/theme_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  Widget _buildLogo() {
    return Column(
      children: [
        Hero(
          tag: "LOGO",
          child: Container(
            height: 100,
            width: 100,
            child: Image.asset("assets/logo.png"),
          ),
        ),
        SizedBox(height: 20),
        Text("Claimzon", style: ThemeStyles.kLabelStyle),
      ],
    );
  }

  Widget _buildPhoneNumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(14),
            ),
            border: Border.all(
              width: 1.0,
              color: ThemeColor.primeryColor,
            ),
          ),
          child: IntlPhoneField(
            decoration: InputDecoration(
              labelText: 'Phone Number',
              hintText: "5611111",
              counterText: "",
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(0),
            ),
            initialCountryCode: 'AE',
            onChanged: (phone) {},
          ),
        ),
      ],
    );
  }

  Widget _buildPassword() {
    return BoxTextFieldWithSuffext(
      hintText: "Password",
      label: "Password",
      errorText: null,
      keyboard: TextInputType.text,
      initialValue: null,
      obscured: true,
      onChange: (value) {},
      suffex: GestureDetector(
        onTap: () {},
        child: Icon(
          true ? Icons.visibility_off : Icons.visibility,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return SimpleCheckBox(
      isChecked: true,
      text: 'Remember me',
      onChange: (value) {},
    );
  }

  Widget _buildLoginBtn() {
    return RoundedShapeButton(
      title: 'LOGIN',
      textStyle: ThemeStyles.kLabelStyleWhite,
      bgColor: ThemeColor.primeryColor,
      onClick: () {
        Get.offAll(HomePage());
      },
    );
  }

  Widget _buildForgotPassword() {
    return GestureDetector(
      onTap: () {
        //Go to forgot Password
      },
      child: Text(
        "Forgot Password?",
        style: ThemeStyles.kLabelBold,
      ),
    );
  }

  Widget _buildOrText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1,
          width: 18,
          color: Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
          ),
          child: Text(
            "or",
            style: ThemeStyles.kHintTextStyleWhiteBg,
          ),
        ),
        Container(
          height: 1,
          width: 18,
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _buildRegisteration() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: RichText(
            text: TextSpan(
                text: 'New to Pangea App? ',
                style: ThemeStyles.kHintTextStyleWhiteBg,
                children: <TextSpan>[
                  TextSpan(
                      text: 'Register?',
                      style: ThemeStyles.kLabelBold,
                      recognizer: TapGestureRecognizer()..onTap = () {})
                ]),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 40.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [],
            ),
            SizedBox(height: Get.height / 8),
            _buildLogo(),
            SizedBox(height: 30.0),
            false
                ? CustomShimmer(
                    highlightColor: ThemeColor.primeryColor,
                  )
                : _buildPhoneNumber(),
            SizedBox(height: 30.0),
            false
                ? CustomShimmer(
                    highlightColor: ThemeColor.primeryColor,
                  )
                : _buildPassword(),
            SizedBox(height: 20.0),
            _buildRememberMeCheckbox(),
            SizedBox(height: 30.0),
            _buildLoginBtn(),
            SizedBox(height: 30.0),
            _buildForgotPassword(),
            SizedBox(height: 10.0),
            _buildOrText(),
            SizedBox(height: 10.0),
            _buildRegisteration(),
          ],
        ),
      ),
    );
  }
}
