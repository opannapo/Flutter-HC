import 'package:flutter/material.dart';
import 'package:hc/controller/bloc/SplashBloc.dart';
import 'package:hc/controller/event/SplashEvent.dart';
import 'package:hc/utils/styles/ColorsConst.dart';
import 'package:hc/utils/styles/StyleConst.dart';

class Splash extends StatefulWidget {
  var scfdRootKey = new GlobalKey<ScaffoldState>();

  @override
  State<StatefulWidget> createState() => new SplashState();
}

class SplashState extends State<Splash> with SplashEvent {
  final SplashBloc bloc = new SplashBloc();

  @override
  SplashState actionState() => this;

  @override
  void initState() {
    super.initState();
    doCheckAppAttributes();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        key: widget.scfdRootKey,
        backgroundColor: ColorsConst.base,
        body: body());
  }

  Widget body() {
    return new StreamBuilder<bool>(
        stream: bloc.loadingSc,
        initialData: false,
        builder: (context, result) {
          return new Center(
              child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Image(
                image: new AssetImage('assets/logo_500.png'),
                color: Colors.white,
                width: 150,
                height: 150,
              ),
              result.data
                  ? new Container(
                      width: 10,
                      height: 10,
                      child: new CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(ColorsConst.white),
                      ),
                    )
                  : new Text(
                      'Welcome',
                      style: TextStyleConst.b14(
                          color: ColorsConst.white, letterSpacing: 2),
                    )
            ],
          ));
        });
  }
}
