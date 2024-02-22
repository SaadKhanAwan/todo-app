import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/provider/addData.dart';
import 'package:todoey_app/widgets/model.dart';
import 'package:todoey_app/widgets/bottomsheet.dart';
import 'package:todoey_app/widgets/listTile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<Task> transferredData =
        Provider.of<DataProvider>(context, listen: false).mylist;
    final provider = Provider.of<DataProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 34),
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 35,
                  child: Icon(
                    Icons.list,
                    size: 55,
                    color: Colors.lightBlueAccent,
                  )),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0, top: 16),
              child: Text(
                "Todoey",
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0, bottom: 28),
              child: Text(
                "12 Tasks",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            Expanded(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Consumer<DataProvider>(
                    builder: (contex, dataprovider, child) {
                      return ListView.builder(
                        itemCount: transferredData.length,
                        itemBuilder: (context, index) {
                          return MyListTile(
                            onlongpress: () {
                              provider.deleteit(index);
                            },
                            task: transferredData[index],
                            onChanged: (value) {
                              provider.toggleTask(index);
                            },
                          );
                        },
                      );
                    },
                  )),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => MyBottomSheet(
                      onAddTask: (taskName) {
                        provider.addTask(Task(name: taskName, isdone: false));
                      },
                    ));
          },
          child: const Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
