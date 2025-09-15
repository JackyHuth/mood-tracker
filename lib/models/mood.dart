import 'package:flutter/material.dart';

/// A class representing a Mood with an unique id, a name and a color.
class Mood {
  final String id;
  final String name;
  final Color color;

  /// Constructor
  Mood({
    required this.id,
    required this.name,
    required this.color,
  });

  /// Converts the Mood instance to a JSON-compatible map
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "color": color.toARGB32(),
  };

  /// Factory constructor to create a Mood instance from a JSON map
  factory Mood.fromJson(Map<String, dynamic> json) => Mood(
    id: json["id"],
    name: json["name"],
    color: Color.fromARGB(
      (json["color"] >> 24) & 0xFF,
      (json["color"] >> 16) & 0xFF,
      (json["color"] >> 8) & 0xFF,
      json["color"] & 0xFF,
    ),
  );
}
