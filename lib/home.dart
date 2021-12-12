import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prayer Times'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget> [
            Card(
              child: SizedBox(
                height: 300,
                child: ListTile(
                  title: Text('Fajr',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  subtitle: Text('In 4 hours'),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Zuhur'),
                subtitle: Text('In 4 hours'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Asr'),
                subtitle: Text('In 4 hours'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Maghrib'),
                subtitle: Text('In 4 hours'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Ishaa'),
                subtitle: Text('In 4 hours'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}