class Movie{
  int id;
  String name;
  String nameOriginal;
  String description;
  String imageLink;

  Movie({
    this.id,
    this.name,
    this.nameOriginal,
    this.description,
    this.imageLink,
  });

  factory Movie.fromMap(Map<String, dynamic> map) => Movie(
    id: map['id'] as int,
    name: map['name'] as String,
    nameOriginal: map['nameOriginal'] as String,
    description: map['description'] as String,
    imageLink: map['imageLink'] as String,
  );
}