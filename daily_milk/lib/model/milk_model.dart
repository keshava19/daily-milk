import 'package:hive/hive.dart';

part 'milk_model.g.dart';

@HiveType(typeId: 0)
class MilkModel extends HiveObject {
    @HiveField(0)
    final String? date;
    @HiveField(1)
    final double? quantity;
    @HiveField(2)
    final double? price;

    MilkModel({this.date, this.quantity, this.price});
}