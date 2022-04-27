import 'package:flutter/material.dart';

class LastInvestmentData{
  final int value;
  final String name;
  LastInvestmentData({required this.value,required this.name});
}

List<LastInvestmentData> lastInvestment=[
  LastInvestmentData(value: 33624,name: "Twitter, Inc. ao"),
  LastInvestmentData(value: 23864, name: "Tesla, Inc. ao"),
  LastInvestmentData(value: 20724, name: "Volkswagon, Inc.ao")
];

class Recommended{
  final String name;
  final String subtitle;
  final String icon;
  final String value;
  Recommended({required this.name, required this.subtitle, required this.icon, required this.value});
}

List<Recommended> recommendedList=[

  Recommended(name: "Netflix, Inc. ao",subtitle: "NFLX Blu-ray Disk, DVD",value: "+0.89%",icon: "assets/netflix.jpg"),
  Recommended(name: "Ozon, Inc. ao",subtitle: "OZON Online store",value: "+1.20%",icon: "assets/ozon.jpg"),
  Recommended(name: "Tesla, Inc. ao",subtitle: "TSLA Automotive industry",value: "+2.49%",icon: "assets/tesla.jpg"),
  Recommended(name:"Black Rock Inc.", subtitle: "BLK Multinational Investment", value: "+0.40%", icon: "assets/blackrock-inc.jpg"),


];
