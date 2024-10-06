import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HiveDemo extends StatefulWidget {
  @override
  State<HiveDemo> createState() => _HiveDemoState();
}

class _HiveDemoState extends State<HiveDemo> {
  var rollNoController = TextEditingController();
  var nameController = TextEditingController();
  Box? studentBox;

  @override
  void initState() {
    studentBox = Hive.box('students');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 150,),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: rollNoController,
                        ),
                        TextField(
                          controller: nameController,
                        ),
                        TextButton(
                          onPressed: () {
                            studentBox?.put(
                              rollNoController.text,
                              nameController.text,
                            );
                            rollNoController.clear();
                            nameController.clear();
                            Navigator.pop(context);
                          },
                          child: Text('submit'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Text('add student'),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: rollNoController,
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextField(
                                        controller: rollNoController,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          studentBox?.delete(
                                            rollNoController.text,
                                          );
                                          Navigator.pop(context);
                                        },
                                        child: Text('submit'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Text('submit'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Text('delete student'),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: rollNoController,
                        ),
                        TextField(
                          controller: nameController,
                        ),
                        TextButton(
                          onPressed: () {
                            studentBox?.put(
                              rollNoController.text,
                              nameController.text,
                            );
                            rollNoController.clear();
                            nameController.clear();
                            Navigator.pop(context);
                          },
                          child: Text('submit'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Text('update student'),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: rollNoController,
                        ),
                        TextButton(
                          onPressed: () {
                            print(studentBox?.get(rollNoController.text));
                            rollNoController.clear();
                            Navigator.pop(context);
                          },
                          child: Text('submit'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Text('show student'),
          ),
          ValueListenableBuilder(
            valueListenable: studentBox!.listenable(),
            builder: (context, Box studentBox, _) {
              return Expanded(
                child: ListView.builder(
                  itemCount: studentBox.keys.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(studentBox.keyAt(index)),
                      subtitle: Text(studentBox.getAt(index)),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
