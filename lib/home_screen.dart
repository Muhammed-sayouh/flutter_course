import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool myCheckBoxValue = false;
  int? selectedValue;
  bool switchButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
       child: Text("data"),
      ),
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text("My App"),
          centerTitle: true,
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome",
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
              Container(
                width: 300,
                height: 300,
                color: const Color(0xffea725d),
              ),
              Checkbox(
                value: myCheckBoxValue,
                onChanged: (bool? myValue) {
                  setState(() {
                    myCheckBoxValue = myValue!;
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2)),
                side: BorderSide(color: Colors.red, width: 5),
                fillColor: WidgetStateProperty.all(Colors.red),
                checkColor: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Male"),
                  Radio(
                    value: 1,
                    groupValue: selectedValue,
                    onChanged: (int? val) {
                      setState(() {
                        selectedValue = val!;
                      });
                    },
                    // fillColor: WidgetStateProperty.all(Colors.red),
                    activeColor: Colors.blue,
                  ),
                ],
              ),
              RadioListTile(
                dense: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                subtitle: Text("Your gender "),
                title: Text("Female"),
                value: 2,
                groupValue: selectedValue,
                onChanged: (int? val) {
                  setState(() {
                    selectedValue = val!;
                  });
                },
                fillColor: WidgetStateProperty.all(Colors.red),
                activeColor: Colors.blue,
              ),
              SwitchListTile(
                title: Text("Dark theme"),
                  value: switchButton,
                  onChanged: (bool? myVal) {
                    setState(() {
                      switchButton = myVal!;
                    });
                  })
            ],
          ),
        ));
  }
}

//ea725d