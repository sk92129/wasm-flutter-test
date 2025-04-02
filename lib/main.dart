import 'package:flutter/material.dart';
import 'package:jsinteropsample/js_helper.dart';
import 'package:jsinteropsample/my_web_widget.dart';
import 'package:jsinteropsample/my_webx_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  void displayResult() {
    print("display from callback");
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const  Text("JS Interop")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyWebWidget(),
              const Text("hello"),
              MyWebXView()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            JSHelper().demoMethod("Hello from Flutter!");
          },
          child: const Icon(Icons.add),
        ),
      )
    );
  }
}
