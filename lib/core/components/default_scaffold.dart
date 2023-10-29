import 'package:flutter/material.dart';
import 'package:weather_project/core/styles/app_colors.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    this.appBar,
    this.horizontalPadding = 16,
  });
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;

  final double horizontalPadding;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/background_cloud.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.1, 0.7, 0.9],
              colors: [
                AppColors.primary.withOpacity(0.7),
                AppColors.primary.withOpacity(0.7),
                AppColors.secondary.withOpacity(0.9),
              ],
              tileMode: TileMode.mirror,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: appBar,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: body,
              ),
            ),
            bottomNavigationBar: bottomNavigationBar,
          ),
        ),
      ],
    );
  }
}
