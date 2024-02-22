class Task {
  String name;
  bool isdone;
  Task({required this.name, required this.isdone});

  toggleit() {
    isdone = !isdone;
  }
}
