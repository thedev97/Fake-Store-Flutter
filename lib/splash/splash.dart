
import 'package:fake_store_v1/routes/app_routes_const.dart';
import 'package:fake_store_v1/shared/utils/image_constant.dart';
import 'package:fake_store_v1/shared/utils/styles/font_styles.dart';
import 'package:fake_store_v1/shared/widgets/button/fs_elevated_button.dart';
import 'package:fake_store_v1/shared/widgets/fs_image_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: _buildGetStartedButton(),
        body: _buildLogo(),
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FSImageView(imagePath: FSImage.appLogo),
        const SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTitle(),
            Text('Search, Find, Ship & Save', style: FSFonts.regularFonts14),
          ],
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Text('Fake Store', style: FSFonts.boldFonts35);
  }

  Widget _buildGetStartedButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      child: FSElevatedButton(
        text: 'Get Started',
        buttonStyle: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        buttonTextStyle: FSFonts.buttonRegularFonts16,
        onPressed: () =>
            context.push("${AppRoutes.product}/${AppRoutes.productList}"),
      ),
    );
  }
}
