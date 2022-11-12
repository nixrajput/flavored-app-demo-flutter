import 'package:flavored_app_demo/models/data_row.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_record.g.dart';

@JsonSerializable()
class DataRecord {
  DataRecord({
    this.page,
    this.total,
    this.records,
    this.rows,
  });

  factory DataRecord.fromJson(Map<String, dynamic> json) =>
      _$DataRecordFromJson(json);

  Map<String, dynamic> toJson() => _$DataRecordToJson(this);

  @JsonKey(name: 'page')
  final int? page;

  @JsonKey(name: 'total')
  final int? total;

  @JsonKey(name: 'records')
  final String? records;

  @JsonKey(name: 'rows')
  final List<RowData>? rows;
}
