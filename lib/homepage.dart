import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDropped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Draggable(
              data: "hi",
              child: (isDropped == true)
                  ? Container()
                  : Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellowAccent,
                      ),
                    ),
              feedback: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellowAccent,
                ),
              ),
              childWhenDragging: Container(),
            ),
            Spacer(),
            DragTarget(
              onAccept: (data) {
                setState(() {
                  isDropped = true;
                });
              },
              onWillAccept: (data) {
                return data == "hi";
              },
              builder: (ctx, accepted, rejected) {
                return Container(
                  height: 500,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: (isDropped == true)
                        ? BoxShape.circle
                        : BoxShape.rectangle,
                    color: (isDropped == true) ? Colors.blue : Colors.blueGrey,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
