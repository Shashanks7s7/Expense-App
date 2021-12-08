import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latest/transaction.dart';

class Transactionlist extends StatelessWidget {
  final List<Transaction> transaction;
  final Function delete;
  Transactionlist(this.transaction,this.delete);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transaction.isEmpty
          ? Column(
              children: [
                Text(
                  "No Transaction Added",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 10),
                Container(
                    height: 200,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemCount: transaction.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal:5,vertical:8),
                  child: ListTile(
                    title: Text(
                      transaction[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat().format(transaction[index].date),
                      style: TextStyle(color: Colors.grey),
                    ),
                    leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FittedBox(
                            child: Text(
                              'Rs.${transaction[index].amount.toStringAsFixed(1)}',
                              style: TextStyle(
                          fontWeight: FontWeight.w900, color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                        )),),
                        trailing: MediaQuery.of(context).size.width<400?IconButton(onPressed: ()=> delete(transaction[index].id), icon: Icon(Icons.delete),color: Colors.red,):
                        FlatButton.icon(onPressed: ()=> delete(transaction[index].id), label:Text("Delete",style:TextStyle(color: Colors.red,)),icon:Icon(Icons.delete), )
                  ),
                );
                /*Card(
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
               Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    padding: EdgeInsets.all(10 ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                     
                    ),
                   
                    child: Center(
                        child: Text(
                      '\$${transaction[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, color: Theme.of(context).primaryColorDark),
                    )),
                  
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                    transaction[index].title.toUpperCase(),
                    style: Theme.of(context).textTheme.title,
                  ),
                  Text(
                    DateFormat().format(transaction[index].date),
                    style: TextStyle(color: Colors.grey),
                  )
                ])
              ]),
            );*/
              }),
    );
  }
}
