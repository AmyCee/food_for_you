// To parse this JSON data, do
//
//     final recipeResponse = recipeResponseFromJson(jsonString);

import 'dart:convert';

List<RecipeResponse> recipeResponseFromJson(String str) => List<RecipeResponse>.from(json.decode(str).map((x) => RecipeResponse.fromJson(x)));

String recipeResponseToJson(List<RecipeResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecipeResponse {
  RecipeResponse({
    this.id,
    this.title,
    this.ingredients,
    this.instructions,
    this.times,
    this.image,
  });

  int? id;
  String? title;
  List<String>? ingredients;
  List<Instruction>? instructions;
  List<String>? times;
  String? image;

  factory RecipeResponse.fromJson(Map<String, dynamic> json) => RecipeResponse(
    id: json["id"],
    title: json["title"],
    ingredients: List<String>.from(json["ingredients"].map((x) => x)),
    instructions: List<Instruction>.from(json["instructions"].map((x) => Instruction.fromJson(x))),
    times: List<String>.from(json["times"].map((x) => x)),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "ingredients": List<String>.from(ingredients!.map((x) => x)),
    "instructions": List<Instruction>.from(instructions!.map((x) => x.toJson())),
    "times": List<String>.from(times!.map((x) => x)),
    "image": image,
  };
}

class Instruction {
  Instruction({
    this.type,
    this.text,
  });

  String? type;
  String? text;

  factory Instruction.fromJson(Map<String, dynamic> json) => Instruction(
    type: json["@type"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "@type": type,
    "text": text,
  };
}