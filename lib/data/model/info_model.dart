class InfoModel {
  final String? synopsis;
  final String? yearsAired;
  final List<CreatorModel> creators;
  final int id;

  InfoModel({
    required this.synopsis,
    required this.yearsAired,
    required this.creators,
    required this.id,
  });

  factory InfoModel.fromJson(Map data) => InfoModel(
        synopsis: data["synopsis"],
        yearsAired: data["yearsAired"],
        creators: (data["creators"] != null && data["creators"] is List)
            ? (data["creators"] as List)
                .map((e) => CreatorModel.fromJson(e))
                .toList()
            : [],
        id: data["id"],
      );
}

class CreatorModel {
  final String? name;
  final String? url;

  CreatorModel({
    required this.name,
    required this.url,
  });

  factory CreatorModel.fromJson(Map data) => CreatorModel(
        name: data["name"],
        url: data["url"],
      );
}
