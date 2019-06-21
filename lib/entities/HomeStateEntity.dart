import 'package:hc/entities/HomeEntity.dart';

class HomeStateEntity {
  HomeEntity _homeEntity;
  bool _isProcessing;
  String _errorMsg;

  HomeEntity get homeEntity => _homeEntity;

  set homeEntity(HomeEntity value) {
    _homeEntity = value;
  }

  bool get isProcessing => _isProcessing;

  set isProcessing(bool value) {
    _isProcessing = value;
  }

  String get errorMsg => _errorMsg;

  set errorMsg(String value) {
    _errorMsg = value;
  }
}
