import 'package:flutter/material.dart';
import 'package:project/models/todo.model.dart';

class ChoiceList extends StatelessWidget {
  final List<ToDo> activities;
  final Function deleteActivities;

  ChoiceList({required this.activities, required this.deleteActivities});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemBuilder: (context, index) {
        var activity = activities[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                activity.image,
              ),
            ),
            title: Text(activity.name),
            subtitle: Text(activity.city),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              color: Colors.redAccent,
              onPressed: () {
                deleteActivities(activity.id);
              },
            ),
          ),
        );
      },
      itemCount: activities.length,
    ));
  }
}
