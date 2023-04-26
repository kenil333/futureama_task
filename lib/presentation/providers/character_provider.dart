import 'package:flutter/material.dart';

import '../../data/model/character_model.dart';
import '../../domain/repository/api_repository.dart';
import '../../utils/app_enums.dart';

class CharacterProvider extends ChangeNotifier {
  final ApiRepository apiRepo = ApiRepository();

  List<CharacterModel> _characterList = [];
  ScreenState _state = ScreenState.loading;

  List<CharacterModel> get characterList => _characterList;
  ScreenState get state => _state;

  void fetchingCharacters() async {
    if (_characterList.isEmpty) {
      final List<CharacterModel> list = await apiRepo.getCharacters();
      if (list.isNotEmpty) {
        _state = ScreenState.fetched;
        _characterList = list;
      } else {
        _state = ScreenState.noResponse;
      }
      notifyListeners();
    }
  }
}
