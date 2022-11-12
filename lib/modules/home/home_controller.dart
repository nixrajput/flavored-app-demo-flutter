import 'dart:convert';

import 'package:flavored_app_demo/api/api_provider.dart';
import 'package:flavored_app_demo/helpers/logger.dart';
import 'package:flavored_app_demo/models/data_record.dart';
import 'package:flavored_app_demo/models/data_row.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get find => Get.find();

  final _apiProvider = ApiProvider();

  final _isLoading = false.obs;
  final List<RowData> _rows = [];
  final _dataRecord = DataRecord().obs;
  final _lastIndex = 10.obs;
  final _hasError = false.obs;
  final _errorMessage = ''.obs;

  bool get isLoading => _isLoading.value;
  List<RowData> get rows => _rows;
  DataRecord get dataRecord => _dataRecord.value;
  int get lastIndex => _lastIndex.value;
  bool get hasError => _hasError.value;
  String get errorMessage => _errorMessage.value;

  set isLoading(bool value) => _isLoading.value = value;

  @override
  onInit() {
    super.onInit();
    _init();
  }

  Future<void> _init() async {
    await _fetchTodos();
    await _parseJsonFromAssets('assets/demo.json');
  }

  Future<void> _fetchTodos() async {
    try {
      isLoading = true;
      update();
      final resonse = await _apiProvider.getTodos();

      if (resonse.isSuccessful) {
        final data = resonse.data;
        AppLogger.log('Response: $data');
      }

      isLoading = false;
      update();
    } catch (e) {
      AppLogger.log(e.toString());
      isLoading = false;
      _hasError.value = true;
      _errorMessage.value = e.toString();
      update();
    }
  }

  Future<void> _parseJsonFromAssets(String assetPath) async {
    AppLogger.log('Parsing Json from $assetPath');

    isLoading = true;
    update();

    try {
      final jsonString = await rootBundle.loadString(assetPath);
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      _dataRecord.value = DataRecord.fromJson(jsonMap);
      AppLogger.log('Json parsed successfully');
      if (_dataRecord.value.rows!.isNotEmpty) {
        var data = _dataRecord.value.rows!.sublist(0, _lastIndex.value);
        _rows.addAll(data);
        _lastIndex.value += 10;
      }

      AppLogger.log(rows);
    } catch (e) {
      AppLogger.log(e.toString());
      _hasError.value = true;
      _errorMessage.value = 'Error: $e';
      update();
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> _loadMore() async {
    if (_dataRecord.value.rows!.isNotEmpty &&
        _lastIndex.value < _dataRecord.value.rows!.length) {
      var data =
          dataRecord.rows!.sublist(_lastIndex.value, _lastIndex.value + 10);
      _rows.addAll(data);
      _lastIndex.value += 10;
    }
    update();
  }

  Future<void> loadMore() => _loadMore();
}
