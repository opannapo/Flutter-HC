import 'package:flutter/material.dart';
import 'package:hc/controller/bloc/HomeBloc.dart';
import 'package:hc/views/Home.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class HomeEvent {
  HomeState actionState();

  HomeState get _state => actionState();

  HomeBloc get _bloc => _state.bloc;

  void eventRequestHomeData() {
    _bloc.doRequestHomeData(_state.context).then((stateSc) {
      if (!stateSc.isProcessing && (stateSc.errorMsg != null))
        _showErrSnackBar(stateSc.errorMsg);
    });
  }

  Future openLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      _showErrSnackBar('Could not launch $url');
    }
  }

  _showErrSnackBar(String msg) {
    final snackBar = SnackBar(
      content: Text('$msg'),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {},
      ),
    );

    _state.widget.scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
