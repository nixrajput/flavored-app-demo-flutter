// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_row.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RowData _$RowDataFromJson(Map<String, dynamic> json) => RowData(
      id: json['id'] as String,
      data: (json['data'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$RowDataToJson(RowData instance) => <String, dynamic>{
      'id': instance.id,
      'data': instance.data,
    };
