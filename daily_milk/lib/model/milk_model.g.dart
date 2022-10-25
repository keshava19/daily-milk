// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'milk_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MilkModelAdapter extends TypeAdapter<MilkModel> {
  @override
  final int typeId = 0;

  @override
  MilkModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MilkModel(
      date: fields[0] as String?,
      quantity: fields[1] as double?,
      price: fields[2] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, MilkModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MilkModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
