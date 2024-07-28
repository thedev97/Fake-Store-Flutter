import 'package:flutter/material.dart';
import 'package:fake_store_v1/splash/widgets/fs_logo.dart';
import 'package:fake_store_v1/splash/widgets/get_started_button.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: GetStartedButton(),
        body: FSLogo(),
      ),
    );
  }
}
