import 'package:fake_store_v1/shared/utils/styles/font_styles.dart';
import 'package:fake_store_v1/shared/widgets/common_widgets.dart';
import 'package:flutter/material.dart';

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
