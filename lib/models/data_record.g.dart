// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataRecord _$DataRecordFromJson(Map<String, dynamic> json) => DataRecord(
      page: json['page'] as int?,
      total: json['total'] as int?,
      records: json['records'] as String?,
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => RowData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataRecordToJson(DataRecord instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total': instance.total,
      'records': instance.records,
      'rows': instance.rows,
    };
