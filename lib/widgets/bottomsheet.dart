import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {
  final Function(String) onAddTask;

  MyBottomSheet({required this.onAddTask});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: const Color(0xff757575),
      child: Container(
        height: screenHeight * 0.75,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Add Task",
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextField(
              controller: controller,
              keyboardType: TextInputType.text,
              autofocus: false,
              decoration:
                  const InputDecoration(focusColor: Colors.lightBlueAccent),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                // padding: EdgeInsets.only(bottom: 10),
                backgroundColor: Colors.lightBlueAccent,
                minimumSize: const Size(370, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                String taskName = controller.text.trim();
                if (taskName.isNotEmpty) {
                  onAddTask(taskName);
                  Navigator.pop(context);
                }
              },
              child: const Text(
                "Add",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
