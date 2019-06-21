import 'dart:ui';

import 'package:flutter/material.dart';

import '../ColorsConst.dart';
import '../StyleConst.dart';

class BaseToolBar extends StatelessWidget {
  String title;
  VoidCallback onLeftPress;
  VoidCallback onRightPress;
  IconData leftIcon;
  Widget rightIcon;

  bool hasLeftIcon;
  bool hasRightIcon;

  BaseToolBar(
      {this.title,
      this.leftIcon,
      this.onLeftPress,
      this.rightIcon,
      this.onRightPress}) {
    hasLeftIcon = this.leftIcon != null;
    hasRightIcon = this.rightIcon != null;
  }

  @override
  Widget build(BuildContext ctx) {
    return new AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0.0,
      elevation: 0.0,
      backgroundColor: ColorsConst.appBar,
      title: Row(
        children: <Widget>[
          new Flexible(
            child: hasLeftIcon
                ? Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: new Icon(
                        leftIcon,
                        color: ColorsConst.white,
                      ),
                      onPressed: onLeftPress,
                    ),
                  )
                : new Container(),
            flex: 50,
          ),
          new Flexible(
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              alignment: Alignment.center,
              child: Text(
                title.toUpperCase() ?? '',
                style: TextStyleConst.b14(color: Colors.white),
              ),
            ),
            flex: 80,
          ),
          new Flexible(
            child: hasRightIcon
                ? Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    alignment: Alignment.centerRight,
                    child: new GestureDetector(
                      onTap: onRightPress,
                      child: rightIcon,
                    ),
                  )
                : new Container(),
            flex: 50,
          ),
        ],
      ),
    );
  }
}
