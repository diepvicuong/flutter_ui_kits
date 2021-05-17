import 'package:get/get.dart';

class HomeController extends GetxController {
  var activeIndex = 2.obs;

  updateIndex(int index) => activeIndex.value = index;
}
