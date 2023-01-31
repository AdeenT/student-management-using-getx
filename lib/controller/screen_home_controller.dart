import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_managment_getx/controller/db_function_controller.dart';
import 'package:student_managment_getx/model/data_model.dart';
import 'package:student_managment_getx/screens/home_screen.dart';

class HomeController extends GetxController {
  final DbFunctionsController _controller = Get.put(DbFunctionsController());
  void submission({
    required BuildContext context,
    required String name,
    required String age,
    required String admn,
    required String email,
  }) async {
    if (name.isEmpty || age.isEmpty || admn.isEmpty || email.isEmpty) {
      Get.snackbar(
        "Form's empty",
        "Please fill the empty forms",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    } else {
      final student = Studentmodel(
        name: name,
        age: age,
        admissionNumber: admn,
        email: email,
      );
      _controller.addStudent(student);
      Get.snackbar(
        "Added",
        "student's data added successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(255, 127, 220, 130),
      );
      Get.to(const ScreenHome());
    }
  }
}
