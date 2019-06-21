import 'package:flutter/material.dart';
import 'package:hc/controller/bloc/HomeBloc.dart';
import 'package:hc/controller/event/HomeEvent.dart';
import 'package:hc/entities/HomeEntity.dart';
import 'package:hc/entities/HomeStateEntity.dart';
import 'package:hc/utils/styles/ColorsConst.dart';
import 'package:hc/utils/styles/StyleConst.dart';
import 'package:hc/utils/styles/components/BaseAppBar.dart';

import '../AppConfig.dart';

class Home extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  State<StatefulWidget> createState() => new HomeState();
}

class HomeState extends State<Home> with HomeEvent {
  final HomeBloc bloc = new HomeBloc();

  @override
  HomeState actionState() => this;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    eventRequestHomeData();
    super.didChangeDependencies();
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
      key: widget.scaffoldKey,
      backgroundColor: Colors.grey.shade100,
      appBar: BaseToolBar(
        title: AppConfig.of(context).appName,
      ).build(context),
      body: new Container(
        child: body(),
      ),
    );
  }

  Widget body() {
    return new StreamBuilder<HomeStateEntity>(
        stream: bloc.homeStateSc,
        initialData: new HomeStateEntity()..isProcessing = true,
        builder: (context, result) {
          HomeStateEntity homeSc = result.data;
          if (homeSc.isProcessing)
            return childLoading();
          else if (homeSc.errorMsg != null)
            return childError(homeSc.errorMsg);
          else
            return new Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: ListView(
                children: <Widget>[
                  new Card(
                      margin: EdgeInsets.all(20),
                      color: Colors.white,
                      child: new Center(
                        child: childProducts(
                            homeSc.homeEntity.productSection.items),
                      )),
                  childArticles(homeSc.homeEntity.articleSection),
                ],
              ),
            );
        });
  }

  Widget childProducts(List<Product> items) {
    return GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: List.generate(items.length, (index) {
          Product p = items[index];
          return new GestureDetector(
              onTap: () => openLink(p.link),
              child: new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Image(
                      image: new NetworkImage(p.productImage),
                      color: Colors.black,
                      width: 40,
                      height: 40,
                    ),
                    new Divider(
                      height: 2,
                      color: Colors.white,
                    ),
                    new Text('${p.productName.split(" ")[1]}',
                        style: TextStyleConst.b12(
                          color: ColorsConst.black,
                        ))
                  ],
                ),
              ));
        }));
  }

  Widget childArticles(ArticleSection articleSection) {
    return new Container(
      child: new ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: articleSection.items.length + 1,
          itemBuilder: (BuildContext context, int index) {
            return index == 0
                ? new Container(
                    margin: EdgeInsets.all(20),
                    child: new Text('${articleSection.sectionTitle}',
                        style: TextStyleConst.b16(color: ColorsConst.black)),
                  )
                : new GestureDetector(
                    onTap: () => openLink(articleSection.items[index - 1].link),
                    child: new Card(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                        color: Colors.white,
                        elevation: 2,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width / 2,
                              decoration: new BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: new NetworkImage(articleSection
                                          .items[index - 1].articleImage))),
                            ),
                            new Container(
                              padding: EdgeInsets.all(10),
                              child: new Text(
                                  '${articleSection.items[index - 1].articleTitle}',
                                  style: TextStyleConst.n14(
                                      color: ColorsConst.black)),
                            ),
                          ],
                        )));
          }),
    );
  }

  Widget childError(String msg) {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text(
            '$msg\n',
            style: TextStyleConst.b12(color: ColorsConst.black),
          ),
          new IconButton(
              icon: new Icon(
                Icons.refresh,
                color: ColorsConst.black,
                size: 30,
              ),
              onPressed: () => eventRequestHomeData()),
        ],
      ),
    );
  }

  Widget childLoading() {
    return new Center(
        child: new Container(
      width: 10,
      height: 10,
      child: new CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(ColorsConst.base),
      ),
    ));
  }
}
