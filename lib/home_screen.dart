import 'package:flutter/material.dart';
import 'package:lati/Model/to_do.dart';
import 'details.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController subController = TextEditingController();
  @override
  List<ToDo> completedlist = [];
  List<ToDo> todolist = [];
  bool isChecked = false;
  bool isDeleted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      //appbar
      appBar: AppBar(
        title: const Text(
          "To-Do App",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.delete),
          )
        ],
      ),
      //body
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
                unselectedLabelColor: Colors.grey,
                labelColor: Color.fromARGB(255, 24, 56, 12),
                indicatorColor: Color.fromARGB(255, 24, 56, 12),
                labelStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                controller: tabController,
                tabs: [
                  Tab(
                    text: "Done",
                  ),
                  Tab(
                    text: "Waiting",
                  ),
                ]),
            SingleChildScrollView(
              child: Expanded(
                child: TabBarView(controller: tabController, children: [
                  Column(children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: completedlist.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            onTap: () {},
                            title: Text(
                              completedlist[index].title,
                            ),
                            subtitle: Text(
                              completedlist[index]
                                  .createdAt
                                  .toString()
                                  .substring(0, 10)
                                  .replaceAll("-", "/"),
                            ),
                            trailing: InkWell(
                                onTap: () {
                                  setState(() {
                                    isDeleted = !isDeleted;
                                  });
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: isDeleted == true
                                      ? Colors.redAccent
                                      : Colors.grey.shade500,
                                )),
                          );
                        }),
                  ]),

                  // Center(
                  //                    widget.tabController.animateTo(1);
                  //   child: Text("Waiting"),
                  // ),
                  ListView.builder(
                      itemCount: todolist.length,
                      itemBuilder: (context, index) {
                        return Column(children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                            todo: todolist[index],
                                          )));
                            },
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 202, 202, 202)),
                                  borderRadius: BorderRadius.circular(20)),
                              tileColor: Colors.white,
                              leading: Checkbox(
                                value: todolist[index].isChecked,
                                activeColor: Colors.green,
                                onChanged: ((value) {
                                  setState(() {
                                    isChecked = !isChecked;
                                    completedlist.add(todolist[index]);
                                  });
                                }),
                              ),
                              title: Text(
                                todolist[index].title,
                                style: TextStyle(
                                    fontSize: 20,
                                    decoration: isChecked == true
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none),
                              ),
                              subtitle: Text(
                                todolist[index]
                                    .createdAt
                                    .toString()
                                    .substring(0, 10)
                                    .replaceAll("-", "/"),
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 15,
                                    decoration: isChecked == true
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none),
                              ),
                              trailing: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isDeleted = !isDeleted;
                                    });
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: isDeleted == true
                                        ? Colors.redAccent
                                        : Colors.grey.shade500,
                                  )),
                            ),
                          )
                        ]);
                      }),
                ]),
              ),
            )
          ],
        ),
      ),
      //floatingActionButton
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: Container(
                    width: 100,
                    height: 250,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 30),
                      child: Column(
                        children: [
                          //title editing
                          TextField(
                            controller: titleController,
                            decoration: InputDecoration(
                              hintText: "Title",
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.green),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromARGB(255, 176, 192, 177)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //subtitle editing
                          TextField(
                            controller: subController,
                            decoration: InputDecoration(
                              hintText: "Subtitle",
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.green),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromARGB(255, 176, 192, 177)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  todolist.add(ToDo(
                                    title: titleController.text,
                                    desc: subController.text.isEmpty
                                        ? null
                                        : subController.text,
                                    createdAt: DateTime.now(),
                                    isChecked: false,
                                  ));
                                  titleController.clear();
                                  subController.clear();
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                                color: Colors.green,
                                child: Row(children: const [
                                  Text(
                                    "Add",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ]),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                color: Colors.green,
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
