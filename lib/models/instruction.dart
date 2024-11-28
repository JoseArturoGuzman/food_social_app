

class Instruction {
  final String imageUrl;
  final String description;
  final int durationInMinutes;

  Instruction({
    required this.imageUrl,
    required this.description,
    required this.durationInMinutes,
  });

  factory Instruction.fromJson(Map<String, dynamic> json) => Instruction(
    imageUrl: json["imageURL"],
    description: json["description"],
    durationInMinutes: json["durationInMinutes"],
  );

  Map<String, dynamic> toJson() => {
    "imageURL": imageUrl,
    "description": description,
    "durationInMinutes": durationInMinutes,
  };
}
