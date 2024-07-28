import 'package:flutter/material.dart';
import 'package:fake_store_v1/shared/utils/image_constant.dart';
import 'package:fake_store_v1/shared/widgets/fs_image_view.dart';
import 'package:fake_store_v1/shared/utils/styles/font_styles.dart';

class FSLogo extends StatelessWidget {
  const FSLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FSImageView(imagePath: FSImage.appLogo),
        const SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Fake Store', style: FSFonts.boldFonts35),
            Text('Search, Find, Ship & Save', style: FSFonts.regularFonts14),
          ],
        ),
      ],
    );
  }
}
