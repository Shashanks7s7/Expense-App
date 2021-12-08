import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class NewTransaction extends StatefulWidget {
  final Function addtx;
  NewTransaction(this.addtx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();
  var da;
  void submitted() {
    if(titlecontroller.text.isEmpty || double.parse(amountcontroller.text) <0 || da==null){
      return;
    }
    widget.addtx(titlecontroller.text, double.parse(amountcontroller.text), da);
    Navigator.of(context).pop();
      }
      void datep(){
        showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2021), lastDate: DateTime.now()).then((value)  {
        if (value==null){
          return;
        }
        setState(() {
           da=value;
        });
       });

      }

  @override
  Widget build(BuildContext context) {
    return  Card(
            elevation: 1,
            shadowColor: Colors.tealAccent,
            child:  Container(
               
              
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(5),
                  child:Column (
                    crossAxisAlignment: CrossAxisAlignment.end,
                    
                    children: [
                      TextField(
                      keyboardType: TextInputType.name
                      ,
                        decoration: InputDecoration(hintText: "Title"),
                        controller: titlecontroller,
                        onSubmitted: (_)=> submitted(),
                      ),
                      SizedBox(height:5),
                      TextField(
                       keyboardType: TextInputType.number,
                        decoration: InputDecoration(hintText: "Amount"),
                        controller: amountcontroller,
                        onSubmitted: (_)=> submitted(),
                      ),
                      SizedBox(height:5),
                      Container(
                        height: 70,
                        child: Row(
                          children:[
                            Expanded (child: Text(da==null?"No Date Choosen":'Picked Date: ${DateFormat.yMd().format(da)}',style: TextStyle(color: Colors.blueGrey),)),
                            SizedBox(width: 10,),
                            RaisedButton(color:Colors.blueGrey, onPressed: datep, child: Text("Pick a Date"))
                          ]),
                      ),
                      
                   
                     RaisedButton(
                        onPressed: () => submitted(),
                        child: Text("Add Transaction",style: Theme.of(context).textTheme.title),
                      )
                    ],
                  ),
                    
            
            
          
            )
      
    );
  }
}
