
import 'Serie.dart';

main() {
  Diffuseur prime = Diffuseur();

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
