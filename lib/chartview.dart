import 'package:flutter/material.dart';
class View extends StatelessWidget {
  final String label;
  final double expenses;
  final double percentage;

   View( this.label, this.expenses, this.percentage); 


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (cxt,constraint){
       return Column(
          
          children: [
            Container(
              padding: EdgeInsets.all(2),
              height:constraint.maxHeight*0.15,
              child: FittedBox(child: Text("Rs.${expenses.toStringAsFixed(1)}"))),
            SizedBox(height:constraint.maxHeight*0.05),
            Container(
              height: constraint.maxHeight*0.6,
              width: 10,
               child: Stack(
                 children: [
                   Container(
                     
                     
                     decoration: BoxDecoration(
border: Border.all(color:Colors.green,width:1),
borderRadius: BorderRadius.circular(10)   ,
color: Color.fromRGBO(220, 220, 220, 1)              ),
                   ),
                   FractionallySizedBox(heightFactor: percentage,
                   child: Container(
                     
                     decoration:BoxDecoration(
                       color:Theme.of(context).primaryColor,
                       borderRadius:BorderRadius.circular(10)
                     )
                   ),)
                 ],),
            ),
            SizedBox(height:constraint.maxHeight*0.05),
            Container(
              height: constraint.maxHeight*0.15,
              child: FittedBox(child: Text(label)))
          ],
          
        
    
    );
    });
    
  }
}