import 'package:flutter/material.dart';
import 'package:flutter_breaking_film/constants/colors_app.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Center(
        child: CircularProgressIndicator(
          color: ColorsApp.yellowColor,
        ),
      ),
    );
  }
}
