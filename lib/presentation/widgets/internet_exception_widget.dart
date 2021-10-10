import 'package:flutter/material.dart';
import 'package:flutter_breaking_film/constants/colors_app.dart';

class InternetExceptionWidget extends StatelessWidget {
  const InternetExceptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off_rounded,
            size: 100,
            color: ColorsApp.whiteColor,
          ),
          Text(
            "No Internet connection",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: ColorsApp.whiteColor,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            child: Text(
              "Please check your internet connection and try again.",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: ColorsApp.whiteColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
