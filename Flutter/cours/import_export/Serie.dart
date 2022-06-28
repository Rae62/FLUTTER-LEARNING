import 'Defuser.dart';
export 'Defuser.dart';


//  Déclaration de classe en dehors de la méthode main

class Serie extends Diffuseur {
  String actor = 'John Doe';
  int number_season = 0;
  bool english = false;
  String client = '';

// Syntaxe du constructor

//   Serie({String var_actor = 'Bizarre', int numbS = 0}) {
//     this.actor = var_actor;
//     this.number_season = numbS;
//   }
// }

  Serie({this.actor = '', this.number_season = 0, this.client = ''}) {}

  // constructor nommé

  Serie.lg_english(
      {this.actor = '',
      this.number_season = 0,
      this.english = true,
      this.client = ''}) {}

// méthodes getter et setter
  String get clientName {
    return 'Mr/ Me : ${this.client}';
  }

  void startYear() {
    print('started in the 2000s');
  }

  static String designation() {
    return ('this is our series');
  }
}