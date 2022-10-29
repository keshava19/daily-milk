import 'dart:io';

import 'package:daily_milk/daily_milk.dart';
import 'package:daily_milk/model/milk_model.dart';
import 'package:daily_milk/utils/hive_constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(MilkModelAdapter());
  initDefaultValues();
  runApp(const DailyMilk());
}

void initDefaultValues() async {
  var box = await Hive.openBox(HiveConstants.boxName);
  var price = box.get(HiveConstants.defaultPrice);
  var quantity = box.get(HiveConstants.defaultQuantity);
  if (price == null) {
    box.put(HiveConstants.defaultPrice, 60.0);
  }
  if (quantity == null) {
    box.put(HiveConstants.defaultQuantity, 1.5);
  }
}
