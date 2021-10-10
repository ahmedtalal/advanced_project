import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking_film/bussiness_logic/cubit/characters_cubit.dart';
import 'package:flutter_breaking_film/constants/colors_app.dart';
import 'package:flutter_breaking_film/data/models/character_model.dart';
import 'package:flutter_breaking_film/presentation/widgets/character_state_builder_widget.dart';
import 'package:flutter_breaking_film/presentation/widgets/internet_exception_widget.dart';
import 'package:flutter_breaking_film/presentation/widgets/loading_indicator_widget.dart';
import 'package:flutter_offline/flutter_offline.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CharacterModel> allCharacters = [];
  List<CharacterModel> filterCharacters = [];
  late String chooseState;
  Icon customeIcon = const Icon(
    Icons.search,
    size: 20,
    color: Colors.black,
  );
  Widget customeSearchBar = const Text(
    "Characters",
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );

  bool isSearched = false;
  @override
  void initState() {
    super.initState();
    CharactersCubit.getInstance(context).getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.greyColor,
      appBar: AppBar(
        backgroundColor: ColorsApp.yellowColor,
        title: customeSearchBar,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (customeIcon.icon == Icons.search) {
                  searchStatus();
                } else {
                  isSearched = false;
                  defaultStatus();
                }
              });
            },
            icon: customeIcon,
          ),
        ],
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return buildBlocWidget();
          } else {
            return InternetExceptionWidget();
          }
        },
        child: LoadingIndicatorWidget(),
      ),
    );
  }

  Padding buildBlocWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<CharactersCubit, CharactersStates>(
        builder: (context, state) {
          if (state is CharactersLoadingState) {
            chooseState = "loading";
            print("loading");
          } else if (state is CharactersLoadedState) {
            chooseState = "loaded";
            allCharacters = state.list;
            print("loaded");
          } else if (state is CharactersExceptionState) {
            chooseState = "error";
            print("error");
          }
          return CharacterStateBuilderWidget(
            characters: isSearched ? filterCharacters : allCharacters,
            choosed: chooseState,
          );
        },
      ),
    );
  }

  void searchStatus() {
    customeIcon = const Icon(
      Icons.cancel,
      size: 20,
      color: Colors.black,
    );
    customeSearchBar = ListTile(
      leading: Icon(
        Icons.search,
        color: Colors.black,
        size: 20,
      ),
      title: TextField(
        cursorColor: Colors.black54,
        decoration: InputDecoration(
          hintText: 'Find a character...',
          hintStyle: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        onChanged: (String value) {
          isSearched = true;
          filterCharacters.clear();
          setState(() {
            allCharacters.forEach((character) {
              if (character.name.toLowerCase().contains(value.toLowerCase())) {
                filterCharacters.add(character);
              }
            });
            if (value.isEmpty) {
              isSearched = false;
            }
          });
          print(filterCharacters.length);
        },
      ),
    );
  }

  void defaultStatus() {
    customeIcon = const Icon(
      Icons.search,
      size: 20,
      color: Colors.black,
    );
    customeSearchBar = const Text(
      "Characters",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
