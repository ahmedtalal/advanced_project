import 'package:flutter/material.dart';
import 'package:flutter_breaking_film/constants/colors_app.dart';

class CharacterInfoWidget extends StatelessWidget {
  final String title, value;
  const CharacterInfoWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: "$title : ",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorsApp.whiteColor,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
