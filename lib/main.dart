
import 'package:flutter/material.dart';
import 'package:new_article_tasks/core/service_locatory.dart';
import 'app/app.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocator();
  runApp(const App());
}