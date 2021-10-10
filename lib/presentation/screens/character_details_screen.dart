import 'package:flutter/material.dart';
import 'package:flutter_breaking_film/constants/colors_app.dart';
import 'package:flutter_breaking_film/data/models/character_model.dart';
import 'package:flutter_breaking_film/presentation/widgets/character_info_widget.dart';
import 'package:flutter_breaking_film/presentation/widgets/sliver_app_bar_widget.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final CharacterModel characterModel;
  const CharacterDetailsScreen({
    Key? key,
    required this.characterModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.greyColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBarWidget(characterModel: characterModel),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CharacterInfoWidget(
                        title: "Job",
                        value: characterModel.jobs.join(' / '),
                      ),
                      buildDivider(336),
                      CharacterInfoWidget(
                        title: "Appeared In",
                        value: characterModel.category,
                      ),
                      buildDivider(253),
                      CharacterInfoWidget(
                        title: "Seasons",
                        value: characterModel.appearance.join(' / '),
                      ),
                      buildDivider(286),
                      CharacterInfoWidget(
                        title: "Status",
                        value: characterModel.status,
                      ),
                      buildDivider(304),
                      characterModel.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : CharacterInfoWidget(
                              title: "Better Call Saul Seasons",
                              value: characterModel.betterCallSaulAppearance
                                  .join(' / '),
                            ),
                      characterModel.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : buildDivider(140),
                      CharacterInfoWidget(
                        title: "Actod/Actress",
                        value: characterModel.portrayed,
                      ),
                      buildDivider(230),
                      CharacterInfoWidget(
                        title: "BirthDay",
                        value: characterModel.birthDay,
                      ),
                      buildDivider(280),
                    ],
                  ),
                ),
                SizedBox(height: 500),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Divider buildDivider(double endIndent) {
    return Divider(
      color: ColorsApp.yellowColor,
      endIndent: endIndent,
      thickness: 2,
      height: 20,
    );
  }
}
