class CharacterModel {
  final CharacterName? name;
  final CharacterImage? images;
  final String? gender;
  final String? species;
  final String? homePlanet;
  final String? occupation;
  final List<String> sayings;
  final int id;
  final String? age;

  CharacterModel({
    required this.name,
    required this.images,
    required this.gender,
    required this.species,
    required this.homePlanet,
    required this.occupation,
    required this.sayings,
    required this.id,
    required this.age,
  });

  factory CharacterModel.fromJson(Map data) => CharacterModel(
        name:
            data["name"] != null ? CharacterName.fromJson(data["name"]) : null,
        images: data["images"] != null
            ? CharacterImage.fromJson(data["images"])
            : null,
        gender: data["gender"],
        species: data["species"],
        homePlanet: data["homePlanet"],
        occupation: data["occupation"],
        sayings: (data["sayings"] != null && data["sayings"] is List)
            ? (data["sayings"] as List).map((e) => e.toString()).toList()
            : [],
        id: data["id"],
        age: data["age"],
      );
}

class CharacterName {
  final String? first;
  final String? middle;
  final String? last;

  CharacterName({
    required this.first,
    required this.middle,
    required this.last,
  });

  factory CharacterName.fromJson(Map data) => CharacterName(
        first: data["first"],
        middle: data["middle"],
        last: data["last"],
      );
}

class CharacterImage {
  final String? headShot;
  final String? main;

  CharacterImage({
    required this.headShot,
    required this.main,
  });

  factory CharacterImage.fromJson(Map data) => CharacterImage(
        headShot: data["head-shot"],
        main: data["main"],
      );
}
