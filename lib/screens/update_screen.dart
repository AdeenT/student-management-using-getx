import 'package:flutter/material.dart';
import 'package:student_managment_getx/model/data_model.dart';

class ScreenProfile extends StatelessWidget {
  final Studentmodel data;

  const ScreenProfile({Key? key, required this.data}) : super(key: key);

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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Student Profile'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 100),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Name : ',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(data.name, style: const TextStyle(fontSize: 25)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Age : ',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(data.age, style: const TextStyle(fontSize: 25)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Admission No : ',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(data.admissionNumber,
                        style: const TextStyle(fontSize: 25)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Email : ',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(data.email, style: const TextStyle(fontSize: 25)),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
