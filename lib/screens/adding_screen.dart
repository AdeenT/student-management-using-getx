import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:student_managment_getx/controller/screen_home_controller.dart';
import 'package:student_managment_getx/model/data_model.dart';

class ScreenAdding extends StatelessWidget {
  final Studentmodel? data;
  final _nameFromController = TextEditingController();
  final _ageFromController = TextEditingController();
  final _adNoFromController = TextEditingController();
  final _emailFromController = TextEditingController();
  final HomeController homecontroller = Get.put(HomeController());
  ScreenAdding({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Students'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
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
                      label: Text('Age'),
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
                      label: Text('Admission Number'),
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
                ElevatedButton(
                  onPressed: () {
                    homecontroller.submission(
                        context: context,
                        name: _nameFromController.text,
                        age: _ageFromController.text,
                        admn: _adNoFromController.text,
                        email: _emailFromController.text);
                  },
                  child: const Text('Add Student'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
