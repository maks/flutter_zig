import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_zig/flutter_zig.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _response = 'calculating...';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    final zig = FlutterZigPlugin();
    // sync call
    final response = zig.fib(7);

    setState(() {
      _response = response.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Zig Plugin example app'),
        ),
        body: Center(
          child: Text('Fibonacci is $_response \n'),
        ),
      ),
    );
  }
}
