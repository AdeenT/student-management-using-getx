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
        backgroundColor:  const Color.fromARGB(255, 50, 50, 50),
        appBar: AppBar(
          title: const Text('Student Profile'),
          centerTitle: true,
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
                      style: TextStyle(fontSize: 25,color: Colors.white),
                    ),
                    Text(data.name, style: const TextStyle(fontSize: 25,color: Colors.white)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Age : ',
                      style: TextStyle(fontSize: 25,color: Colors.white),
                    ),
                    Text(data.age, style: const TextStyle(fontSize: 25,color: Colors.white)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Admission No : ',
                      style: TextStyle(fontSize: 25,color: Colors.white),
                    ),
                    Text(data.admissionNumber,
                        style: const TextStyle(fontSize: 25, color: Colors.white)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Email : ',
                      style: TextStyle(fontSize: 25,color: Colors.white),
                    ),
                    Text(data.email, style: const TextStyle(fontSize: 25, color: Colors.white)),
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
