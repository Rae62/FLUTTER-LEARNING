main(List<String> arguments) {
  // list équivalente aux array

  // List<int> list = [1, 2, 3 , 'Hello']; pas possible car type int
  List<int> list = [1, 2, 3, 11, 2];

  list.add(9); // comme push

  // pour supprimer 2 solutions

  list.remove(2); // on précise la valeur

  list.removeAt(0); // on précise l'index

  print(list);
  print(list.length);
  print(list[3]);

// list.forEach((l) { print(1);
// });

// on a le résultat entre parenthèses car cela nous retounre un iterable
// var puissance = list.map( (l) {
//     return l * l;
//   });

//   print(puissance.toList());

// Map// objet
  Map mymap = {
    'name': 'Doe',
    'notes': [20, 18, 17, 20]
  };

  mymap['nationality'] = 'american';

// on peut récuperer les clés , valeurs et le tout

  print(mymap);
  print(mymap.keys);
  print(mymap.values);
  print(mymap.entries);
}
