import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  String channelName;

  CallScreen({required this.channelName, super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  AgoraClient? client;

  @override
  void initState() {
    initAgora(widget.channelName);
    super.initState();
  }

  void initAgora(String channelName) async {
    client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
          appId: "0a1e7853be7944429861d007a70064c5", channelName: channelName, username: "user"),
    );
    await client!.initialize();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(
              client: client!,
              layoutType: Layout.oneToOne,
              enableHostControls: true,
            ),
            AgoraVideoButtons(
              client: client!,
              addScreenSharing: false,
            )
          ],
        ),
      ),
    );
  }
}
