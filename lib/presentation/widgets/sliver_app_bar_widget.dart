import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breaking_film/constants/colors_app.dart';
import 'package:flutter_breaking_film/constants/strings.dart';
import 'package:flutter_breaking_film/data/models/character_model.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    Key? key,
    required this.characterModel,
  }) : super(key: key);

  final CharacterModel characterModel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 500,
      stretch: true,
      pinned: true,
      backgroundColor: ColorsApp.greyColor,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          characterModel.nickName,
          style: TextStyle(
            fontSize: 20,
            color: ColorsApp.whiteColor,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: characterModel.charId,
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: characterModel.image,
            placeholder: (context, url) => Image(
              image: AssetImage(placeholderImage),
              height: double.maxFinite,
              width: double.maxFinite,
            ),
            errorWidget: (context, url, error) => Image(
              image: AssetImage(
                errorImage,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
