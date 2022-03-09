import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nftapp/controllers/counterController.dart';
import 'package:nftapp/pages/other.dart';

class HomeScreen extends StatelessWidget {
  final CounterCountroller counterCountroller = Get.put(CounterCountroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Obx is needed to actually update counter
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Clicks: ${counterCountroller.counter.value}"),
            SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.to(OtherScreen());
                },
                child: Text("Open other Screen"),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          counterCountroller.increment();
        }),
        child: Icon(Icons.add),
      ),
    );
  }
}
