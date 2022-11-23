class Task {
  String title;
  bool isChecked;

  Task({this.title, this.isChecked});

  void toggleDone() {
    isChecked = !isChecked;
  }
}
