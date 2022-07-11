import 'package:flutter/material.dart';
import '../../../models/todo.model.dart';

class VisitCard extends StatelessWidget {
  final ToDo todo;
  final bool isSelected;
  final VoidCallback toggleVisit;

  VisitCard({
    required this.todo,
    required this.isSelected,
    required this.toggleVisit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: Stack(fit: StackFit.expand, children: [
          Ink.image(
            image: AssetImage(todo.image),
            fit: BoxFit.cover,
            child: InkWell(
              onTap: toggleVisit,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text(todo.name,
                    //     style: const TextStyle(
                    //       fontSize: 18,
                    //       color: Colors.white,
                    //     )),
                    Flexible(
                      // child: FittedBox(
                        child: Text(todo.name,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            )),
                      ),
                    // ),
                    // Flexible(
                    //   child: Container(
                    //     color: Colors.blue,
                    //     height: 50,
                    //   ),
                    //   flex: 2,
                    // ),
                    // Flexible(
                    //   child: Container(
                    //     color: Colors.red,
                    //     height: 50,
                    //   ),
                    //   flex: 1,
                    // ),
                    // Flexible(
                    //   child: Container(
                    //     color: Colors.green,
                    //     height: 50,
                    //   ),
                    //   flex: 1,
                    // ),
                    if (isSelected)
                      Icon(
                        Icons.check,
                        size: 20,
                        color: Colors.white,
                      ),
                  ],
                ),
              ],
            ),
          )
        ]));
  }
}
