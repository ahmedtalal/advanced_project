import 'package:flutter/material.dart';
import 'package:flutter_breaking_film/constants/colors_app.dart';

class ExceptionWidget extends StatelessWidget {
  final String message;
  const ExceptionWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/images/emptysearch.png"),
            height: 200,
            width: double.infinity,
          ),
          Text(
            message,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: ColorsApp.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
