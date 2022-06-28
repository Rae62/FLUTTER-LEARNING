main() {

  // ce n'est pas obligatoire mais il est recommander de typer le reotur des fonctions 
  // void est un typage qui indique que l'on ne retourne rien

  String func(String s1 , [String s2 = 'John ?']) {
    return  s1 +' How are you ' + s2;
  }

  ;

  print(func('Hello'));
}
