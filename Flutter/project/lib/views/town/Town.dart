import 'package:flutter/material.dart';
import 'package:project/models/city.model.dart';
import 'package:project/views/home/Home.dart';
import 'package:project/views/town/widgets/discover_list.dart';
import './widgets/travel_view.dart';
import 'package:project/data/data.dart' as data;
import '../../models/todo.model.dart';
import '../../models/travel.model.dart';
import './widgets/choice_list.dart';
import '../../models/city.model.dart';

class Town extends StatefulWidget {
  List<ToDo> tovisit = data.tovisit;

  showContext({required BuildContext context, required List<Widget> children}) {
    var orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch, children: children);
    } else {
      return Column(children: children);
    }
  }

  @override
  _TownState createState() => _TownState();
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

  double get amount {
    // equivalent a reduce
    return ourTravel.activitiesToDo.fold(0.00, (previousValue, element) {
      var activity = widget.tovisit.firstWhere((act) => act.id == element);
      return previousValue + activity.price;
    });
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
            initialDate: DateTime.now().add(const Duration(days: 1)),
            firstDate: DateTime.now(),
            lastDate: DateTime(2023))
        .then((newDate) => {
              if (newDate != null)
                {
                  // print(newDate);
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

  void saveOurTravel() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            contentPadding: EdgeInsets.all(10),
            title: Text(
              'Sauvegardez votre voyage ?',
              textAlign: TextAlign.start,
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    child: Text(
                      'Annuler',
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).errorColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context, 'Cancel');
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    child: Text(
                      'Sauvegarder',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context, 'Save');
                    },
                  ),
                ],
              ),
            ],
          );
        }).then((value) {
      print(value);
      Navigator.pushNamed(context, Home.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    final City city = ModalRoute.of(context)!.settings.arguments as City;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Notre Voyage'),
          actions: const <Widget>[
            Icon(Icons.more_vert),
          ]),
      body: Container(
        padding: EdgeInsets.all(10),
        child: widget.showContext(
          context: context,
          children: [
            TravelView(
              ourTravel: ourTravel,
              setDate: setDate,
              cityName: city.name,
              amount: amount,
            ),
            Expanded(
              child: index == 0
                  ? DiscoverList(
                      todo: widget.tovisit,
                      toggleVisit: toggleVisit,
                      selectedVisit: ourTravel.activitiesToDo,
                    )
                  : ChoiceList(
                      activities: visitActivities,
                      deleteActivities: deleteChoiceVisit,
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.forward),
        onPressed: saveOurTravel,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'A découvrir',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.start),
            label: 'Mes visites',
          ),
        ],
        onTap: (value) {
          print(value);
          switchIndex(value);
        },
      ),
    );
  }
}
