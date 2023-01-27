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
    if (name.isEmpty ||
        age.isEmpty ||
        admn.isEmpty ||
        email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Padding(
            padding: EdgeInsets.only(left: 50),
            child: Text('Please fill all seven fields including image.'),
          ),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      final student = Studentmodel(
        name: name,
        age: age,
        admissionNumber: admn,
        email: email,
      );
      _controller.addStudent(student);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Padding(
          padding: EdgeInsets.only(left: 90),
          child: Text('Student added Succesfully.'),
        ),
        backgroundColor: Colors.greenAccent[400],
      ));
      Get.to(const ScreenHome());
    }
  }
}
