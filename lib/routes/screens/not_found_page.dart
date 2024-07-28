import 'package:flutter/material.dart';
import 'package:fake_store_v1/shared/utils/styles/font_styles.dart';
import 'package:fake_store_v1/shared/widgets/app_bar/app_bar_builder.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Center(
        child: Text(
          'Not Found',
          style: FSFonts.errorFonts,
        ),
      ),
    );
  }
}
