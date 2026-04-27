import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool valueOfSwitchTile = false;
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  List<Widget> items = [
    Container(
      color: Colors.red,
      width: double.infinity,
      child: Text("Item 1"),
    ),
    Container(
      color: Colors.green,
      width: double.infinity,
      child: Text("Item 2"),
    ),
    Container(
      color: Colors.blue,
      width: double.infinity,
      child: Text("Item 3"),
    ),
    Container(
      color: Colors.yellow,
      width: double.infinity,
      child: Text("Item 4"),
    ),
    Container(
      color: Colors.orange,
      width: double.infinity,
      child: Text("Item 5"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("This is the Categories Screen"),
            SwitchListTile(
                title: Text("Switch Button"),
                subtitle: Text("This is a switch button"),
                value: valueOfSwitchTile,
                onChanged: (value) {
                  setState(() {
                    valueOfSwitchTile = value;
                  });
                }),
            CarouselSlider(
                items: imgList.map((String value) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(9),
                    child: Image.network(
                      value,
                      fit: BoxFit.fill,
                      
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 400,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ))
          ],
        ),
      ),
    );
  }
}
