import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nftapp/controllers/counterController.dart';

class OtherScreen extends StatelessWidget {
  final CounterCountroller _counterController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Screen was clicked ${_counterController.counter.value} times"),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text("Open other Screen"),
          ),
        ],
      ),
    );
  }
}
