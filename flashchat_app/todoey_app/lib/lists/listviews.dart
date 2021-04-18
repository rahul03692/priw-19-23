import 'list_tiles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todolist.dart';

class ListViews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TotalList>(
      builder: (context, listdata, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTiles(
                check: listdata.TodoList[index].done,
                text: listdata.TodoList[index].name,
                onchange: (value) {
                  listdata.update(listdata.TodoList[index]);
                },
                longpress: (){
                  listdata.delete(index);
                },
              );
            },
            itemCount: listdata.count,
          ),
        );
      },
    );
  }
}
