main() {
  print('Hello flutter'); //console log

  // pour les variables on utilise var (contrairement à js)
  var name = 'Thomas';
  // name = 2; on ne peut pas modifier le type d'une variable (string to int impossible)
  name = 'John';
  print(name);

  String actor = 'Robert De Niro';

  int age = 65;

  bool alive = true;

  double taille = 1.65;

  // String complete_name = '$name Shelby';
  String complete_name =
      '${name.toUpperCase()} Shelby'; // pour utiliser une expression JS on utilise {}
  print(complete_name);

  // avec const on ne peut pas réassigner

  // const int number = 1254;
  // number = 5;
  // print(number);

  // final est comme une const sauf qu'elle sera sera assigné lors de la compilation du code

  add(n1, n2) {
    final int sum = n1 + n2;
  }
}
