import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  int? num;

  void setNum(int index) {
    num = index;
    update();
  }
}
