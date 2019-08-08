import 'package:flutter/material.dart';
import 'package:vanilla_example/src/bloc/user_screen_bloc.dart';
import 'package:vanilla_example/src/model/repository.dart';
import 'package:vanilla_example/src/model/vanilla_screen_model.dart';
import 'package:vanilla_example/src/repository.dart';


void main() {
  Repository repo = new Repository();
  runApp(UserBlocScreen(repo));
}