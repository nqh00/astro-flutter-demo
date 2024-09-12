class Astronaut {
  final String name;
  final String craft;

  Astronaut({required this.name, required this.craft});

  factory Astronaut.fromJson(Map<String, dynamic> json) {
    return Astronaut(
      name: json['name'],
      craft: json['craft'],
    );
  }
}