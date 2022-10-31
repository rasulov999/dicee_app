import 'package:flutter/material.dart';
import 'dart:math';

class DiceApp extends StatefulWidget {
  const DiceApp({Key? key}) : super(key: key);

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int imgNum = 1;
  int imgNum2 = 6;
  int total = 0;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor:(count>=1)? Colors.primaries[Random().nextInt(Colors.primaries.length)]: Colors.amberAccent,
        elevation: 0,
        centerTitle: true,
        title: const Text('dice app'),
      ),
      backgroundColor: (count >= 1)
          ? Colors.primaries[Random().nextInt(Colors.primaries.length)]
          : Colors.amberAccent,
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Image.asset('assets/images/dice$imgNum.png'),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Image.asset('assets/images/dice$imgNum2.png'),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: InkWell(
                onTap: () {
                  setState(() {
                    Random random = Random();
                    imgNum2 = random.nextInt(6) + 1;
                    imgNum = random.nextInt(6) + 1;
                    total += imgNum + imgNum2;
                    count++;
                  });
                },
                child: Expanded(
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue.shade400,
                    ),
                    child: Center(
                      child: Text(
                        "Click here",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Total: $total'),
            SizedBox(
              height: 10,
            ),
            Text('Count: $count'),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: InkWell(
                onTap: () {
                  setState(() {
                    imgNum = 1;
                    imgNum2 = 6;
                    total = 0;
                    count = 0;
                  });
                },
                child: Expanded(
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.redAccent.shade400,
                    ),
                    child: Center(
                      child: Text(
                        "Reset",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget diceButton(String imgNum) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Image.asset('assets/images/dice$imgNum.png'),
      ),
    );
  }
}
