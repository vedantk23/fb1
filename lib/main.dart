import 'package:app_utip/providers/TipCalculatorModel.dart';
import 'package:app_utip/widgets/row_widget.dart';
import 'package:app_utip/widgets/slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'dart:math';

void main(){
  runApp(ChangeNotifierProvider(create: (context)=> Tipcalculatormodel(),child: const MyApp(),));
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
 

 
@override
  Widget build(BuildContext context) {
    final provider = Provider.of<Tipcalculatormodel>(context);
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
             Text("My Bill is ${provider.personTotal().round() }",style: style.copyWith(
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
                provider.updateTotal(double.parse(value));

              },
            ),
            //split 
            RowWidget(theme: theme, counter:provider.counter,onIncrement: (){
             provider.updateCounter(provider.counter+1);
            },onDecrement:(){
              if(provider.counter>1){
                provider.updateCounter(provider.counter-1);
              }

            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Tip"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${(provider.tip * 100).round()}%"),
                ),
              ],
            ),
             Text("${(provider.tip * 100).round()}%"),
            SliderWidget(tip: provider.tip,onChanged: 
            (double value){
              provider.tippercentage(value);
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




