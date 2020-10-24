import 'package:flutter/material.dart';
import 'package:movie_app/common/extension/size_extensions.dart';

class Logo extends StatelessWidget {
  final double height;

  const Logo({Key key, this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/pngs/logo.png",
      color: Colors.white,
      height: height.h,
    );
  }
}
