// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subs_detail_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubsDetailModelAdapter extends TypeAdapter<SubsDetailModel> {
  @override
  final int typeId = 2;

  @override
  SubsDetailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubsDetailModel(
      isAddSub: fields[0] as bool,
      price: fields[1] as String,
      name: fields[2] as String,
      subsType: fields[3] as SubsType,
      logo: fields[4] as String,
      bgColor: fields[5] as int,
      textColor: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SubsDetailModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.isAddSub)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.subsType)
      ..writeByte(4)
      ..write(obj.logo)
      ..writeByte(5)
      ..write(obj.bgColor)
      ..writeByte(6)
      ..write(obj.textColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubsDetailModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubsTypeAdapter extends TypeAdapter<SubsType> {
  @override
  final int typeId = 1;

  @override
  SubsType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SubsType.month;
      case 1:
        return SubsType.year;
      default:
        return SubsType.month;
    }
  }

  @override
  void write(BinaryWriter writer, SubsType obj) {
    switch (obj) {
      case SubsType.month:
        writer.writeByte(0);
        break;
      case SubsType.year:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubsTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
