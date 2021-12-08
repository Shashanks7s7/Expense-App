import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latest/transaction.dart';

import 'chartview.dart';
 class Chart extends StatelessWidget {
  final List<Transaction> recenttransaction;
  Chart(this.recenttransaction);
  List<Map<String,Object>> get groupedtransaction{
    return List.generate( 7, (index) {
      final weekday= DateTime.now().subtract(Duration(days:index));
      var sum=0.0;
       for(int i=0;i<recenttransaction.length;i++){
         if(recenttransaction[i].date.day==weekday.day &&
            recenttransaction[i].date.month==weekday.month&&
            recenttransaction[i].date.year==weekday.year){
              sum=sum+recenttransaction[i].amount;
            }       }
   return {'day':DateFormat.E().format(weekday).substring(0,1) ,'amount': sum};
  }).reversed.toList();}
  double get maxspend{
    return groupedtransaction.fold(0.0, (su, element) {return su + element['amount'];});
  }
  
  @override
  Widget build(BuildContext context) {
   
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          
          
            children: groupedtransaction.map((e) =>
            Flexible(
              fit: FlexFit.tight,
              child: View(e['day'],e['amount'], maxspend==0.0? 0.0:(e['amount'] as double) / maxspend))
            ).toList()
             

          ),
      )
        
      
      
    );
  }
 }