import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking_film/bussiness_logic/cubit/characters_cubit.dart';
import 'package:flutter_breaking_film/data/api_services/characters_web_Services.dart';
import 'package:flutter_breaking_film/data/repositories/characters_repository.dart';
import 'package:flutter_breaking_film/presentation/screens/home.dart';

void main() {
  runApp(BreakingFilmApp());
}

class BreakingFilmApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<CharactersCubit>(
        create: (context) => CharactersCubit(
          repositoryModel: CharactersRepository(
            apiServicesModel: CharactersWebServices(),
          ),
        ),
        child: Home(),
      ),
    );
  }
}
