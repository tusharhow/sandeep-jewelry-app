import 'package:get/get.dart';

class CartCotroller extends GetxController {
  int counter = 0;
  void increments() {
    counter++;
    update();
  }

  void decrements() {
    if (counter == 0) {
      counter = 1;
    } else {
      counter--;
      update();
    }
  }
}
