import 'package:flutter/material.dart';

import 'event/AnalyticsEvent.dart';
import 'page/FirstPage.dart';

void main() => runApp(new MaterialApp(home: new MyApp(),),);

class MyApp extends StatefulWidget {
    @override
    _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

    static const String pageId = 'page_main';
    @override
    initState() {
        super.initState();
        AnalyticsEvent.postPageEvent(pageId, true);
    }

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
                title: new Text('Analytics'),
            ),
            body: new Center(
                child: new Column(
                    children: this._renderItems(),
                    mainAxisSize: MainAxisSize.min,
                ),
            ),
        );
    }

    List<Widget> _renderItems() {

        return [
            this._renderCalcEventWidget(),
            this._renderStatisticsEventWidget(),
            this._renderPageStatusEventWidget(),
        ];
    }

    Widget _renderCalcEventWidget() {

        return new InkWell(
            child: new ListTile(
                title: new Text('Calculate Event'),
            ),
            onTap: () {
                AnalyticsEvent.postCalcEvent();
            },
        );
    }

    Widget _renderStatisticsEventWidget() {

        return new InkWell(
            child: new ListTile(
                title: new Text('Statistics Event'),
            ),
            onTap: () {
                AnalyticsEvent.postStatisticsEvent();
            },
        );
    }

    Widget _renderPageStatusEventWidget() {

        return new InkWell(
            child: new ListTile(
                title: new Text('PageStatus Event -> [open page]'),
            ),
            onTap: () {
                FirstPage.open(context);
            },
        );
    }

    @override
    void deactivate() {
        super.deactivate();
    }

    @override
    void dispose() {
        super.dispose();
        AnalyticsEvent.postPageEvent(pageId, false);
    }
}