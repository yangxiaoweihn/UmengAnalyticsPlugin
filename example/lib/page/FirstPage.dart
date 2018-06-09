

import 'package:flutter/material.dart';

import '../event/AnalyticsEvent.dart';
import 'SecondPage.dart';

class FirstPage extends StatefulWidget {
    static void open(BuildContext context) {

        MaterialPageRoute route = new MaterialPageRoute(
            builder: (context) => new FirstPage(),
        );

        Navigator.push(context, route);
    }

    @override
    _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

    static const String pageId = 'page_first';

    @override
    void initState() {
        super.initState();

        AnalyticsEvent.postPageEvent(pageId, true);
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            
            appBar: new AppBar(
                title: new Text('FirstPage'),
            ),

            body: new Container(
                child: _renderPageStatusEventWidget(),
            ),
        );
    }

    Widget _renderPageStatusEventWidget() {

        return new InkWell(
            child: new ListTile(
                title: new Text('PageStatus Event -> [open page]'),
            ),
            onTap: () {
                SecondPage.open(context);
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