import 'package:flutter/material.dart';

class FSAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FSAppBar({
    super.key,
    this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
    this.width,
    this.isDefaultStyle,
  });

  final double? height;
  final double? width;
  final Style? styleType;
  final double? leadingWidth;
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final List<Widget>? actions;
  final bool? isDefaultStyle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      toolbarHeight: height ?? kToolbarHeight,
      automaticallyImplyLeading: true,
      backgroundColor: Colors.transparent,
      flexibleSpace: isDefaultStyle == true ? _getDefaultStyle() : _getStyle(),
      leadingWidth: leadingWidth ?? kToolbarHeight - 16,
      leading: leading,
      title: title,
      titleSpacing: kRadialReactionRadius,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize =>
      Size(width ?? double.infinity, height ?? kToolbarHeight);

  Widget? _getStyle() {
    switch (styleType) {
      case Style.bgFill:
        return const SizedBox(
          height: kToolbarHeight,
          width: double.infinity,
        );
      default:
        return null;
    }
  }

  Widget? _getDefaultStyle() {
    switch (styleType) {
      case Style.bgFill:
        return const SizedBox(
          height: 0,
          width: double.infinity,
        );
      default:
        return null;
    }
  }
}

enum Style { bgFill }
