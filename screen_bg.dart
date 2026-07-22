import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class ScreenBg extends StatelessWidget {
  final Widget child;
  final bool showBackButton;
  final String? title;

  const ScreenBg({
    super.key,
    required this.child,
    this.showBackButton = false,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: title != null
          ? AppBar(
        title: Text(title!),
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: showBackButton,
      )
          : null,
      body: SafeArea(child: child),
    );
  }
}
