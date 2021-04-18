import 'package:flutter/material.dart';
import 'package:todoey_app/lists/todolist.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String addText;
    return Flexible(
      child: Container(
        color: Color(0xff757575),
        child: Container(
          padding: EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.lightBlueAccent,
                ),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value){
                  addText=value;
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                color: Colors.lightBlueAccent,
                child: Text('Add',style: TextStyle(
                  color: Colors.white,
                ),),
                onPressed: (){
                  Provider.of<TotalList>(context,listen: false).addTask(addText);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
