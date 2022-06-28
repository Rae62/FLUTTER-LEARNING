import 'package:flutter/material.dart';
import 'package:project/models/todo.model.dart';
import 'package:project/views/town/widgets/visit_card.dart';

class DiscoverList extends StatelessWidget {
  final List<ToDo> todo;
  final List<String> selectedVisit;
  final Function toggleVisit;

  DiscoverList(
      {required this.todo,
      required this.selectedVisit,
      required this.toggleVisit});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        crossAxisCount: 2,
        children: todo
            .map((t) => VisitCard(
                todo: t,
                isSelected: selectedVisit.contains(t.id),
                toggleVisit: () {
                  toggleVisit(t.id);
                }))
            .toList());
  }
}
