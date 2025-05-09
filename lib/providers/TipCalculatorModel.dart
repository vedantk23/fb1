import 'package:flutter/material.dart';

class Tipcalculatormodel extends ChangeNotifier {
  double counter = 1;
 double tip = 0;
 double total = 0;
 double persont=0;
 
 double get bill{
  return total;
 }

 double get personCounter{
  return counter;
 }
 void updateTotal(double value){
  total = value;
  notifyListeners();
 }
void tippercentage(double tip){
  this.tip = tip;
  notifyListeners();
}
void updateCounter(double value){
  counter=value;
  notifyListeners();
}
double personTotal(){
 
  return (total + (total * tip)) / counter;
  
}
}