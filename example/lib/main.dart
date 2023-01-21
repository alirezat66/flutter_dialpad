import 'package:flutter/material.dart';
import 'package:flutter_dialpad/flutter_dialpad.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = MaskedTextController(mask: '00000');
  @override
  void initState() {
    controller.text = '123';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
          children: [
            DialPad(
                enableDtmf: true,
                //outputMask: "(000) 000-0000",
                backspaceButtonIconColor: Colors.red,
                buttonTextColor: Colors.white,
                dialOutputTextColor: Colors.white,
                controller: controller,
                keyPressed: (value) {
                  print('$value was pressed');
                },
                makeCall: (number) {
                  print(number);
                  setState(() {
                    controller.clear();
                  });
                }),
          ],
        )),
      ),
    );
  }
}
