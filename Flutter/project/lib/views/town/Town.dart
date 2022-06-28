import 'package:flutter/material.dart';
import 'package:project/models/todo.model.dart';
import 'package:project/models/travel.model.dart';
import 'package:project/views/town/widgets/choice_list.dart';
import 'package:project/views/town/widgets/discover_list.dart';
import 'package:project/views/town/widgets/travel_view.dart';
import 'package:project/views/town/widgets/visit_card.dart';
import '../../data/data.dart' as data;
import 'package:intl/intl.dart';

class Town extends StatefulWidget {
  final List<ToDo> tovisit = data.tovisit;
  int index = 0;

  showContext({required BuildContext context, required List<Widget> children}) {
    var orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      );
    } else {
      return Column(children: children);
    }
  }

  @override
  State<Town> createState() => _TownState();
}

class _TownState extends State<Town> {
  late Travel ourTravel;
  late int index;

  @override
  void initState() {
    ourTravel = Travel(activitiesToDo: [], city: 'Paris', date: DateTime.now());
    index = 0;
  }

  List<ToDo> get visitActivities {
    return widget.tovisit.where((visit) {
      return ourTravel.activitiesToDo.contains(visit.id);
    }).toList();
  }

  void toggleVisit(String id) {
    setState(() {
      ourTravel.activitiesToDo.contains(id)
          ? ourTravel.activitiesToDo.remove(id)
          : ourTravel.activitiesToDo.add(id);
    });
    print(ourTravel.activitiesToDo);
  }

  void deleteChoiceVisit(String id) {
    setState(() {
      ourTravel.activitiesToDo.remove(id);
    });
  }

  void setDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now().add(Duration(days: 1)),
            firstDate: DateTime.now(),
            lastDate: DateTime(2023))
        .then((newDate) => {
              if (newDate != null)
                {
                  // print(newDate),
                  setState(() {
                    ourTravel.date = newDate;
                  })
                }
            });
  }

  void switchIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left),
        title: Text('Notre voyage'),
        actions: <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: widget.showContext(context: context, children: [
            TravelView(ourTravel: ourTravel, setDate: setDate),
            Expanded(
              child: index == 0
                  ? DiscoverList(
                      todo: widget.tovisit,
                      toggleVisit: toggleVisit,
                      selectedVisit: ourTravel.activitiesToDo)
                  : ChoiceList(
                      activities: visitActivities,
                      deleteActivities: deleteChoiceVisit,
                    ),
            ),
          ])),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'A découvrir'),
          BottomNavigationBarItem(
              icon: Icon(Icons.stars), label: 'Mes visites'),
        ],
        onTap: (value) {
          print(value);
          switchIndex(value);
        },
      ),
    );
  }
}
