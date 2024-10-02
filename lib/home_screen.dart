import 'package:flutter/material.dart';

import 'call_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _channelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Calling"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: TextFormField(
                controller: _channelController,
                decoration: InputDecoration(labelText: "Enter Channel Name", border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final channelName = _channelController.text;
                if (channelName.isNotEmpty) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CallScreen(channelName: channelName),
                      ));
                }
              },
              child: Text("Join"),
            ),
          ],
        ),
      ),
    );
  }
}
