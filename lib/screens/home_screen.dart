import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_managment_getx/controller/db_function_controller.dart';
import 'package:student_managment_getx/screens/adding_screen.dart';
import 'package:student_managment_getx/screens/screen_editor.dart';
import 'package:student_managment_getx/screens/screen_search.dart';
import 'package:student_managment_getx/screens/update_screen.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DbFunctionsController controller = Get.put(DbFunctionsController());
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.amberAccent.shade200, Colors.amber],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 50, 50, 50),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('Student List'),
          actions: [
            IconButton(
              onPressed: () {
                controller.searchStudent('');
                Get.to(ScreenSearch());
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: SafeArea(
          child: Obx(
            () {
              return ListView.separated(
                  itemBuilder: (ctx, index) {
                    var data = controller.studentlistNotifier[index];
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 8, left: 8),
                      child: Card(
                        color: const Color.fromARGB(255, 255, 226, 123),
                        child: ListTile(
                          leading: const CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                                "https://cdn-icons-png.flaticon.com/512/201/201818.png"),
                          ),
                          title: Text(data.name.toUpperCase()),
                          subtitle: const Text('Click here to see profile'),
                          trailing: Wrap(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.to(ScreenEditing(
                                    data: data,
                                    editorClicked: true,
                                  ));
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Color.fromARGB(255, 0, 151, 5),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text(
                                              'Alert',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                            content: const Text(
                                                'Are you sure you want to delete this profile'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Get.offAll(
                                                      const ScreenHome());
                                                },
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    if (data.id != null) {
                                                      controller.deleteStudent(
                                                          data.id!);
                                                      Get.back();
                                                    }
                                                  },
                                                  child: const Text('Yes'))
                                            ],
                                          );
                                        });
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ))
                            ],
                          ),
                          onTap: () {
                            Get.to(() => ScreenProfile(data: data));
                          },
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return const SizedBox();
                  },
                  itemCount: controller.studentlistNotifier.length);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 10, 230, 17),
          onPressed: () {
            Get.to(() => ScreenAdding());
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
