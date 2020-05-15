import 'package:flutter/material.dart';

double getWidth(BuildContext context) => MediaQuery.of(context).size.width;
double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

double formatDouble(double number, [int n = 0]){
  int a = (number * (10 ^ n)).round();
  double res = a / (10 ^ n);
  return res;
}