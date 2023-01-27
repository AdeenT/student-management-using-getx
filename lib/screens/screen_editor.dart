import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_managment_getx/controller/db_function_controller.dart';
import 'package:student_managment_getx/controller/screen_editor_controller.dart';
import 'package:student_managment_getx/model/data_model.dart';

class ScreenEditing extends StatelessWidget {
  final Studentmodel? data;
  bool? editorClicked = false;
  final _nameFromController = TextEditingController();
  final _ageFromController = TextEditingController();
  final _adNoFromController = TextEditingController();
  final _emailFromController = TextEditingController();
  final DbFunctionsController _controller = Get.put(DbFunctionsController());
  final EditingCotroller _editingCotroller = Get.put(EditingCotroller());
  ScreenEditing({Key? key, this.data, this.editorClicked}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _nameFromController.text = data!.name;
    _ageFromController.text = data!.age;
    _adNoFromController.text = data!.admissionNumber;
    _emailFromController.text = data!.email;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Edit Student Details'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _nameFromController,
                  decoration: const InputDecoration(
                    label: Text('Name'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _ageFromController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('age'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _adNoFromController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Admission No'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _emailFromController,
                  decoration: const InputDecoration(
                    label: Text('Email'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            
              ElevatedButton.icon(
                onPressed: () {
                  _editingCotroller.submission(
                      context: context,
                      name: _nameFromController.text,
                      age: _ageFromController.text,
                      admn: _adNoFromController.text,
                      email: _emailFromController.text,
                      id: data!.id);
                },
                icon: const Icon(Icons.update),
                label: const Text('Update Profile'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void clear() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _nameFromController.clear();
    _ageFromController.clear();
    _adNoFromController.clear();
    _emailFromController.clear();
  }
}
