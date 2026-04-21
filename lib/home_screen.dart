import 'package:flutter/material.dart';
import 'package:flutter_course/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool myCheckBoxValue = false;
  int? selectedValue;
  bool switchButton = false;

  List<String> myList = [
    "Flutter",
    "Dart",
    "Java",
    "Python",
    "C++",
    "JavaScript",
    "Go",
    "Swift",
    "Kotlin",
    "Ruby"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber, width: 3),
                  // borderRadius: BorderRadius.circular(40),
                    color: Colors.amber,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/image_one.jpg'))),
              ),
              SizedBox(
                height: 50,
              ),
              ListTile(
                title: Text("Profile"),
                leading: Icon(Icons.person),
                subtitle: Text("Go to Profile Screen"),
                // enabled: false,
                dense: true,
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  // Navigator.of(context).pushNamed("/profile");
                  //---------------------------------------------
                  Navigator.of( context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const ProfileScreen(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text("My App"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
                side: BorderSide(color: Colors.amber, width: 2),
              ),
              elevation: 5,
              child: SizedBox(
                height: 100,
                child: Center(
                  child: Text(
                    myList[index],
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
            );
          },
          itemCount: myList.length,
        ));
  }
}

//ea725d