import 'package:flutter/material.dart';
import 'package:hc/controller/bloc/SplashBloc.dart';
import 'package:hc/utils/PageRoutes.dart';
import 'package:hc/views/Home.dart';
import 'package:hc/views/Splash.dart';

abstract class SplashEvent {
  SplashState actionState();

  SplashState get _state => actionState();

  SplashBloc get _bloc => _state.bloc;

  void doCheckAppAttributes() {
    _bloc.doDummyLoading().then((isLoading) {
      if (!isLoading) {
        new Future.delayed(Duration(milliseconds: 1000)).then((val) {
          Navigator.of(_state.context)
              .pushReplacement(new PageRouteFade(new Home(), 500));
        });
      }
    });
  }
}
