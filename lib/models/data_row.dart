import 'package:json_annotation/json_annotation.dart';

part 'data_row.g.dart';

@JsonSerializable()
class RowData {
  RowData({
    required this.id,
    required this.data,
  });

  factory RowData.fromJson(Map<String, dynamic> json) =>
      _$RowDataFromJson(json);

  Map<String, dynamic> toJson() => _$RowDataToJson(this);

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'data')
  final List<String> data;
}
