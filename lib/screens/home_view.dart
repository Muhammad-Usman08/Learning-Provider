import 'dart:async';

import 'package:count_example/providers/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 0), (timer){
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    countProvider.counter();

    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
        backgroundColor: Colors.blue[400],
      ),
      body: Center(
        child: Consumer<CountProvider>(
          builder: (context, value, child) {
            print('rebuild');
            return Text(
              value.count.toString(),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            countProvider.counter();
          },
          child: Icon(Icons.add)),
    );
  }
}
