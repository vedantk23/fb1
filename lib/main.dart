import 'package:app_utip/widgets/row_widget.dart';
import 'package:app_utip/widgets/slider_widget.dart';
import 'package:flutter/material.dart';
//import 'dart:math';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return MaterialApp(
    title: 'Calculator',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue), 
      useMaterial3: true,
    ),
    home: MyHomePage(),

   );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});

@override
State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage>{
 int counter = 1;
 double tip = 0;
 int total = 0;
 double tipCalculator(double tip){
  return tip*100;
 }

 void incrementCounter(){
 setState(() {
  if(counter<=100){
   counter++;}
 });
    
  
 }
 void decrementCounter(){
  setState(() {
    if(counter>1){
    counter--;}
  });
 }
@override
  Widget build(BuildContext context) {
   var theme = Theme.of(context);
   final style = theme.textTheme.displayMedium!.copyWith(
    color: theme.colorScheme.onPrimary,
    fontSize: 20,
    fontWeight: FontWeight.bold,
   );
   return Scaffold(appBar: AppBar(
    title: const Text('Utip'),
   ),

body: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
     Padding(
      padding: const EdgeInsets.all(10.0),
      child: 
       Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        width:100,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Total Per Person", style: style,),
             Text("My Bill is ${((total + (total* tip))/counter).round() }",style: style.copyWith(
              fontSize:15,
             )),
            ]
          ),
       ),
     ),

     Padding(
       padding: const EdgeInsets.all(8.0),
       child: Container(
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          // border: Border.all(
          //   color: theme.colorScheme.primary,
          //   width:2,
          // )
        ),
        child: Column(
          children: <Widget>[
            TextField(
                decoration :InputDecoration(
                labelText: "Enter your bill amount",
                border : OutlineInputBorder(),
                prefixIcon: Icon(Icons.attach_money),
                
              ),
              keyboardType: TextInputType.number,
              onChanged: (String value){
                // print("Value is $value");
                total = int.parse(value);

              },
            ),
            //split 
            RowWidget(theme: theme, counter: counter,onIncrement: incrementCounter,onDecrement:decrementCounter),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Tip"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${(tip * 100).round()}%"),
                ),
              ],
            ),
             Text("${(tip * 100).round()}%"),
            SliderWidget(tip: tip,onChanged: 
            (double value){
              setState(() {
                tip = value;
              });
            },),
            


          ],
        ),
       ),
     )






    ],



    
  ),
   
   );
  }

}




