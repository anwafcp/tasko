import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/application/authatication/controller/auth_countroller.dart';
import 'package:task_app/application/authatication/view/sign_in.dart';
import 'package:task_app/application/taks/controller/task_controller.dart';
import 'package:task_app/application/taks/model/task_model.dart';
import 'package:task_app/application/taks/view/profile/users_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> formskey = GlobalKey();
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final homes = Provider.of<AuthCountroller>(context);
    final dbprovider = Provider.of<TaskController>(context);

    return Scaffold(
      // backgroundColor: Colors.yellow,
      appBar: AppBar(
        // actions: [
        //   IconButton(onPressed: () {}, icon: Icon(Icons.navigate_next))
        // ],
        title: Center(
          child: Text(
            "Do Your Task",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 30,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: formskey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: title,
                decoration: InputDecoration(
                    hintText: "Title",
                    prefixIcon: Icon(Icons.text_fields),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            BorderSide(width: 3.0, color: Colors.black))),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: desc,
                maxLines: 5,
                decoration: InputDecoration(
                    hintText: "enter your discription",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(width: 3.0, color: Colors.black),
                    )),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: EdgeInsets.only(right: 190),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white12,
                        minimumSize: Size(150, 50),
                        side: BorderSide(
                          width: 3,
                        )),
                    onPressed: () {
                      if (formskey.currentState!.validate()) ;
                      final task =
                          TaskModel(decs: desc.text, tilte: title.text);
                      dbprovider.saveData(task);
                    },
                    child: Text("Save",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700))),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: StreamBuilder<List<TaskModel>>(
                    stream: dbprovider.getData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(
                          child: Text("No data available"),
                        );
                      }
                      // return Text("no data");
                      final data = snapshot.data!;
                      return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final item = data[index];
                            return Container(
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.yellowAccent.withOpacity(0.3),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(item.tilte),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(item.decs),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            dbprovider.delete(dbprovider
                                                .delete(item.docmentId!));
                                          },
                                          icon: Icon(Icons.delete)),
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  TextEditingController
                                                      edittitle =
                                                      TextEditingController(
                                                          text: item.tilte);
                                                  TextEditingController
                                                      editdecs =
                                                      TextEditingController(
                                                          text: item.decs);

                                                  return AlertDialog(
                                                    title: Text("edit"),
                                                    content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        TextField(
                                                          controller: edittitle,
                                                          decoration: InputDecoration(
                                                              labelText:
                                                                  "title",
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15))),
                                                        ),
                                                        SizedBox(
                                                          height: 15,
                                                        ),
                                                        TextField(
                                                            controller:
                                                                editdecs,
                                                            decoration: InputDecoration(
                                                                labelText:
                                                                    "description",
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15))))
                                                      ],
                                                    ),
                                                    actions: [
                                                      // TextButton(
                                                      //   child: Text("delete"),
                                                      //   onPressed: () {
                                                      //     Navigator.of(context)
                                                      //         .pop();
                                                      //   },
                                                      // ),
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            final updateTask =
                                                                TaskModel(
                                                                    decs: editdecs
                                                                        .text,
                                                                    tilte: edittitle
                                                                        .text);
                                                            dbprovider.editData(
                                                              updateTask,
                                                              item.docmentId!,
                                                            );
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text("save"))
                                                    ],
                                                  );
                                                });
                                          },
                                          icon: Icon(Icons.edit)),
                                    ],
                                  )
                                ],
                              ),
                            );
                          });
                    }),
              ),
              ElevatedButton(
                  onPressed: () {
                    homes.signOut();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UsersProfile(),
                        ));
                  },
                  child: Text("profile")),
              ElevatedButton(
                  onPressed: () {
                    homes.signOut();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInPage(),
                        ));
                  },
                  child: Text("Sign out"))
            ],
          ),
        ),
      ),
    );
  }
}
