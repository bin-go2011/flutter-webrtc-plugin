import 'package:flutter/material.dart';

/*
 * getUserMedia sample
 */
class GetUserMediaSample extends StatefulWidget {
  @override
  _GetUserMediaState createState() => _GetUserMediaState();
}

class _GetUserMediaState extends State<GetUserMediaSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetUserMedia API Test'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              // child: RTCVideoView(_localRenderer, mirror: true),
              decoration: BoxDecoration(color: Colors.black54),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.phone),
      ),
    );
  }
}
