// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_model_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LikeModelHiveAdapter extends TypeAdapter<LikeModelHive> {
  @override
  final int typeId = 0;

  @override
  LikeModelHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LikeModelHive(
      id_product: fields[0] as String,
      title: fields[1] as String,
      photo: fields[2] as String,
      price: fields[3] as num,
    );
  }

  @override
  void write(BinaryWriter writer, LikeModelHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id_product)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.photo)
      ..writeByte(3)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LikeModelHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
