import 'package:flutter/material.dart';
import 'package:fake_store_v1/shared/utils/image_constant.dart';
import 'package:fake_store_v1/shared/utils/styles/font_styles.dart';
import 'package:fake_store_v1/shared/widgets/app_bar/fs_app_bar.dart';

PreferredSizeWidget buildAppBar(BuildContext context, {Widget? cart}) {
  return FSAppBar(
    centerTitle: true,
    title: Text('Fake Store', style: FSFonts.regularFonts20),
    leading: Image.asset(FSImage.appLogo, scale: 3.5),
    actions: <Widget>[cart ?? Container()],
  );
}

PreferredSizeWidget buildDetailsAppBar({required String title}) {
  return FSAppBar(
    centerTitle: true,
    isDefaultStyle: true,
    title: Text(title, style: FSFonts.regularFonts20),
  );
}

PreferredSizeWidget buildCartAppBar({required String title, Widget? cart}) {
  return FSAppBar(
    centerTitle: true,
    isDefaultStyle: true,
    title: Text(title, style: FSFonts.regularFonts20),
    actions: <Widget>[cart ?? Container()],
  );
}
