import 'package:flutter/material.dart';
import 'package:project/models/city.model.dart';
import 'package:project/rootWidgets/Drawer.dart';
import 'package:project/views/home/Home.dart';
import 'package:project/views/town/widgets/discover_list.dart';
import 'package:project/views/trips/widgets/trips.dart';
import './widgets/travel_view.dart';
import '../../datas/data.dart' as data;
import '../../models/todo.model.dart';
import '../../models/travel.model.dart';
import './widgets/choice_list.dart';
import '../../models/city.model.dart';

class Town extends StatefulWidget {
  static String routeName = '/town';
  final City city;
  final Function addTrip;

  List<ToDo> get tovisitModel {
    return city.todos;
  }

  Town({required this.city, required this.addTrip});

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
    ourTravel = Travel(activitiesToDo: [], city: widget.city.name, date: DateTime.now());
    index = 0;
  }

  double get amount {
    return ourTravel.activitiesToDo.fold(0.00, (previousValue, element) {
      return previousValue + element.price;
    });
  }

  void toggleVisit(ToDo todo) {
    setState(() {
      ourTravel.activitiesToDo.contains(todo)
          ? ourTravel.activitiesToDo.remove(todo)
          : ourTravel.activitiesToDo.add(todo);
    });

    print(ourTravel.activitiesToDo);
  }

  void deleteChoiceVisit(ToDo todo) {
    setState(() {
      ourTravel.activitiesToDo.remove(todo);
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
      if (value == 'Save') {
        print("hello");
        widget.addTrip(ourTravel);
        Navigator.pushNamed(context, Home.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notre Voyage'), actions: const <Widget>[
        Icon(Icons.more_vert),
      ]),
      drawer: ourDrawer(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: widget.showContext(
          context: context,
          children: [
            TravelView(
              ourTravel: ourTravel,
              setDate: setDate,
              cityName: widget.city.name,
              amount: amount,
            ),
            Expanded(
              child: index == 0
                  ? DiscoverList(
                      todo: widget.tovisitModel,
                      toggleVisit: toggleVisit,
                      selectedVisit: ourTravel.activitiesToDo,
                    )
                  : ChoiceList(
                      activities: ourTravel.activitiesToDo,
                      deleteChoiceVisit: deleteChoiceVisit,
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
