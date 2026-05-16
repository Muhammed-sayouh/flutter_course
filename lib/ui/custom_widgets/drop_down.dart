import 'package:flutter/material.dart';

class DropdownExample extends StatefulWidget {
  const DropdownExample({super.key});

  @override
  State<DropdownExample> createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String selectedValue = 'Cairo';

  List<String> cities = [
    'Cairo',
    'Alex',
    'Mansoura',
    'Tanta',
  ];

  String selectedCity = 'Cairo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dropdown Button Example'),
        ),
        body: DropdownButton<String>(
          
          style: const TextStyle(
            color: Colors.red,
            fontSize: 16,
          ),
          value: selectedCity,
          isExpanded: true,
          underline: const Divider(
            color: Colors.black,
            thickness: 2,
          ),
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          items: cities.map((String myValue) {
            return DropdownMenuItem<String>(
              value: myValue,
              child: Text(myValue),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              selectedCity = value!;
            });
          },
        )

        // Center(
        //   child: DropdownButton<String>(
        //     value: selectedValue,
        //     underline: const Divider(),
        //     isExpanded: true,
        //     icon: const Icon(Icons.keyboard_arrow_down_rounded),

        //     items: cities.map((String city) {
        //       return DropdownMenuItem<String>(
        //         value: city,
        //         child: Text(city),
        //       );
        //     }).toList(),

        //     onChanged: (String? newValue) {
        //       setState(() {
        //         selectedValue = newValue!;
        //       });
        //     },
        //   ),
        // ),
        );
  }
}
