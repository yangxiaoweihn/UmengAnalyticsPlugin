

import 'package:flutter/material.dart';

import '../event/AnalyticsEvent.dart';

class SecondPage extends StatefulWidget {
    static void open(BuildContext context) {

        MaterialPageRoute route = new MaterialPageRoute(
            builder: (context) => new SecondPage(),
        );

        Navigator.push(context, route);
    }

    @override
    _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with Page{

    static const String pageId = 'page_second';

    @override
    void initState() {
        super.initState();

        AnalyticsEvent.postPageEvent(pageId, true);
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            
            appBar: new AppBar(
                title: new Text('SecondPage'),
            ),

            body: new Container(

            ),
        );
    }

    @override
    void dispose() {
        super.dispose();
        AnalyticsEvent.postPageEvent(pageId, false);
    }
}