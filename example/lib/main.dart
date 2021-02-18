import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:webrtc/webrtc.dart';
import 'package:webrtc_example/route_item.dart';

import 'pages/get_user_media_sample.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<RouteItem> items;

  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    _initItems();
    // initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await Webrtc.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  ListBody _buildRow(context, item) {
    return ListBody(children: <Widget>[
      ListTile(
        title: Text(item.title),
        onTap: () => item.push(context),
        trailing: Icon(Icons.arrow_right),
      ),
      Divider()
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter-WebRTC example'),
          ),
          body: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(0.0),
              itemCount: items.length,
              itemBuilder: (context, i) {
                return _buildRow(context, items[i]);
              })),
    );
  }

  void _initItems() {
    items = <RouteItem>[
      RouteItem(
          title: 'GetUserMedia',
          push: (BuildContext context) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => GetUserMediaSample()));
          }),
      // RouteItem(
      //     title: 'GetDisplayMedia',
      //     push: (BuildContext context) {
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (BuildContext context) =>
      //                   GetDisplayMediaSample()));
      //     }),
      // RouteItem(
      //     title: 'LoopBack Sample',
      //     push: (BuildContext context) {
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (BuildContext context) => LoopBackSample()));
      //     }),
      // RouteItem(
      //     title: 'DataChannel',
      //     push: (BuildContext context) {
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (BuildContext context) => DataChannelSample()));
      //     }),
    ];
  }
}
