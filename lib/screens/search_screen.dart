import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_managment_getx/controller/db_function_controller.dart';
import 'package:student_managment_getx/screens/profile_screen.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({Key? key}) : super(key: key);
  final searchController = TextEditingController();
  final DbFunctionsController _controller = Get.put(DbFunctionsController());

  @override
  Widget build(BuildContext context) {
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
          title: const Text('Search Students'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                      child: TextField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter student name to search',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        controller: searchController,
                        onChanged: (value) {
                          _controller.searchStudent(value);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () {
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          var data = _controller.searchData[index];
                          if (data.name
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase())) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Card(
                                color: const Color.fromARGB(255, 255, 226, 123),
                                child: ListTile(
                                  onTap: () {
                                    Get.to(ScreenProfile(data: data));
                                  },
                                  title: Text(data.name),
                                  leading: const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                          "https://cdn-icons-png.flaticon.com/512/201/201818.png"),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: _controller.searchData.length),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
