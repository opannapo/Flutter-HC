import 'package:rxdart/rxdart.dart';

class SplashBloc {
  final BehaviorSubject<bool> _loadingSc = BehaviorSubject<bool>();

  BehaviorSubject<bool> get loadingSc => _loadingSc;

  void dispose() {
    _loadingSc.close();
  }

  Future<bool> doDummyLoading() async {
    loadingSc.sink.add(true);
    return await new Future.delayed(Duration(milliseconds: 5000)).then((val) {
      loadingSc.sink.add(false);
      return false;
    });
  }
}
