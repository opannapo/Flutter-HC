import 'package:flutter/material.dart';
import 'package:hc/entities/HomeEntity.dart';
import 'package:hc/entities/HomeStateEntity.dart';
import 'package:hc/utils/remote/Api.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final BehaviorSubject<HomeStateEntity> _homeStateSc =
      BehaviorSubject<HomeStateEntity>();

  BehaviorSubject<HomeStateEntity> get homeStateSc => _homeStateSc;

  void dispose() {
    _homeStateSc.close();
  }

  Future<HomeStateEntity> doRequestHomeData(BuildContext context) async {
    homeStateSc.sink.add(new HomeStateEntity()..isProcessing = true);

    return await new API(context).home().then((map) async {
      HomeEntity homeResult = map['homeEntity'];
      homeStateSc.sink.add(new HomeStateEntity()
        ..isProcessing = false
        ..errorMsg = null
        ..homeEntity = homeResult);
      return homeStateSc.value;
    }).catchError((onError) {
      print("doRequestHomeData $onError");
      homeStateSc.sink.add(new HomeStateEntity()
        ..isProcessing = false
        ..errorMsg = "Something went wrong please try again");
      return homeStateSc.value;
    });
  }
}
