
import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

class CallScreen extends StatefulWidget {
  final String channelName;

  CallScreen({required this.channelName});

  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  late RtcEngine _rtcEngine;
  bool _joined = false;
  int _remoteUid = 0;

  @override
  void initState() {
    super.initState();
    initRTC();
  }

  Future<void> initRTC() async {
    await RtcEngine.createWithConfig(RtcEngineConfig('<YOUR_APP_ID>'));

    //_rtcEngine = (await RtcEngine.instance)!;
    _rtcEngine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          setState(() {
            _joined = true;
          });
        },
        userJoined: (int uid, int elapsed) {
          setState(() {
            _remoteUid = uid;
          });
        },
        userOffline: (int uid, UserOfflineReason reason) {
          setState(() {
            _remoteUid = 0;
          });
        },
      ),
    );

    await _rtcEngine.enableVideo();
    await _rtcEngine.joinChannel(null, widget.channelName, null, 0);
  }

  @override
  void dispose() {
    _rtcEngine.destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agora Video Call'),
      ),
      body: Center(
        child: _joined
            ? Stack(
          children: [
            //RtcRemoteView.SurfaceView(uid: _remoteUid),
            RtcLocalView.SurfaceView(),
          ],
        )
            : CircularProgressIndicator(),
      ),
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => CallScreen(channelName: 'myChannel'),
        //   ),
        // );
    );
  }
}