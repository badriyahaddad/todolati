class ToDo {
  String? id;
  String title;
  String? desc;
  bool isChecked;
  DateTime createdAt;
  ToDo(
      {required this.title,
      required this.desc,
      required this.isChecked,
      required this.createdAt});
}
