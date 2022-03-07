import 'package:get/get.dart';

class CounterCountroller extends GetxController {
  var counter = 0.obs;

  void increment() {
    counter++;
  }
}
