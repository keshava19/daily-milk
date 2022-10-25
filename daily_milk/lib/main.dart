import 'dart:io';

import 'package:daily_milk/daily_milk.dart';
import 'package:daily_milk/model/milk_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(MilkModelAdapter());
  await Hive.openBox('hive_box');
  runApp(const DailyMilk());
}
