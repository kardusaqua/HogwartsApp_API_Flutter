import 'package:flutter/cupertino.dart';
import 'package:hogwarts/app/models/character_model.dart';
import 'package:hogwarts/app/services/remote_service.dart';


class CharacterController extends ChangeNotifier{
  bool isLoading = false;
  List<CharacterModel> characters = [];

  CharacterController(){
    fetchCharacters();
  }

  Future<void> fetchCharacters() async{
    isLoading = true;
    notifyListeners();

    characters = await RemoteServices.fetchCharacter();
    isLoading = false;
    notifyListeners();
  }
}