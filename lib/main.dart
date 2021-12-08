



import 'package:flutter/material.dart';
import 'package:latest/newtransaction.dart';
import 'package:latest/transaction.dart';
import 'package:latest/transactionlist.dart';

import 'chart.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutteo',
      theme: ThemeData(
       fontFamily: "Quicksand",
       textTheme: ThemeData.light().textTheme.copyWith(
         title:TextStyle(fontFamily: "OpenSans",fontSize:18,fontWeight: FontWeight.bold,
         color: Theme.of(context).primaryColor),
         
       ),
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.black,
        appBarTheme: AppBarTheme(
          textTheme:ThemeData.light().textTheme.copyWith(
            title:TextStyle(fontFamily: "OpenSans",fontSize:22,fontWeight: FontWeight.bold)
          )
        )
        

      ),
      home: MyHomePage(title: 'Flutter De Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  
  final List<Transaction> usertransaction = [
  
  ];
   List<Transaction> get _recenttrans{
    return usertransaction.where((v) {return  v.date.isAfter(DateTime.now().subtract(Duration(days: 7)));}).toList();
  }
   void _addnewT ( String title, double amount , DateTime choose){
    final newtx = Transaction(id:DateTime.now().toString(),title:title,amount:amount,date:choose);

 setState(() {
   usertransaction.add(newtx);
 });
  }

  void Showform (BuildContext context){
   showModalBottomSheet(

     isScrollControlled: true,
     backgroundColor: Theme.of(context).primaryColorDark,


     
     context: context, builder: (_){
      
      
      return Container(
        height: 460,
        child: SingleChildScrollView(

          
          
            child: NewTransaction(_addnewT)
        ),
      );
    });
  }
  void deleteTransaction(String id){
    setState(() {
      usertransaction.removeWhere((element) => element.id==id);
    }); 
  }
  bool clicked=false;
  
final appbar= AppBar(
        title: Text("Expenses"),
        centerTitle: false,
        
      ); 
  @override
  Widget build(BuildContext context) {
    final islandscape =MediaQuery.of(context).orientation==Orientation.landscape;
    var tt= Container(
           height:  MediaQuery.of(context).size.height*0.9-appbar.preferredSize.height-MediaQuery.of(context).viewPadding.top,
           child: Transactionlist(usertransaction,deleteTransaction));
    return Scaffold(
      
      appBar:appbar,
      body:SingleChildScrollView(child:
      Column(
        children:[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(islandscape ) 
              Container(
                height: MediaQuery.of(context).size.height*0.1,
                child: Switch(
                  
                  value: clicked, onChanged: (val){
                  setState(() {
                    clicked=val;
                  });
                }),
              )
            ],
          ),
           if(!islandscape) Container(
              height: MediaQuery.of(context).size.height*0.4-appbar.preferredSize.height-MediaQuery.of(context).viewPadding.top,
              child: Chart(_recenttrans)),
              if(!islandscape)
        
        tt,
        if(islandscape)clicked ?
         Container(
              height: MediaQuery.of(context).size.height*0.7-appbar.preferredSize.height-MediaQuery.of(context).viewPadding.top,
              child: Chart(_recenttrans))
              :tt,
        

        ]
      ),),
      floatingActionButton: FloatingActionButton(onPressed: ()=>Showform(context),
      child: Icon(Icons.add),
      splashColor: Theme.of(context).primaryColor,),
      
              
              
      
    );
    
  }
}
