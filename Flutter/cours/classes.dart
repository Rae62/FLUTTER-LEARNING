// L'héritage des classes avec le mot clé extends

class Diffuseur {
  String name = 'netflix';
  double price;

  Diffuseur({this.price = 15.99});
}

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

  Serie({this.actor = '', this.number_season = 0, this.client = ''}):super(price: 0) {}

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

main() {
  // on instancie notre classe
  // avec dart le new est optionnel

  // Serie peaky_blinders =  Serie();
  Serie peaky_blinders =
      new Serie(actor: 'Cilian Murphy', number_season: 6, client: 'Orange');
  Serie stranger_things =
      new Serie(actor: 'Wynona Ryder', number_season: 4, client: 'Black');
  Serie sex_education = Serie.lg_english(
      actor: 'Gillian Anderson',
      number_season: 3,
      english: true,
      client: 'Pink');
  print(peaky_blinders.actor);
  print(Serie.designation());
  print(peaky_blinders.number_season);
  print(stranger_things.actor);
  print(stranger_things.number_season);
  print(sex_education.actor);
  print(sex_education.number_season);
  print(sex_education.english);
  print(sex_education.clientName);
  print(sex_education.price);
  print(sex_education.name);
  sex_education.startYear();
}
