import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_managment_getx/controller/db_function_controller.dart';
import 'package:student_managment_getx/model/data_model.dart';
import 'package:student_managment_getx/screens/home_screen.dart';

class EditingCotroller extends GetxController {
  final DbFunctionsController _controller = Get.put(DbFunctionsController());
  void submission(
      {required BuildContext context,
      required String name,
      required String age,
      required String admn,
      required String email,
      int? id}) async {
    if (name.isEmpty || age.isEmpty || admn.isEmpty || email.isEmpty) {
      Get.snackbar(
        "Cannot update",
        "please fill the empty fields ",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      final student = Studentmodel(
        name: name,
        age: age,
        admissionNumber: admn,
        email: email,
        id: id,
      );
      _controller.updateStudent(student);
      Get.snackbar(
        "Updated",
        "profile updated successfully",
        backgroundColor: const Color.fromARGB(255, 157, 237, 161),
      );

      await Future.delayed(const Duration(milliseconds: 500));
      Get.offAll(() => const ScreenHome());
    }
  }
}
