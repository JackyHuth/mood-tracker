class MoodLog {
  final DateTime timestamp;
  final List<String> moodIds;

  MoodLog({required this.timestamp, required this.moodIds});

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp.toIso8601String(),
        "moodIds": moodIds,
      };

  factory MoodLog.fromJson(Map<String, dynamic> json) => MoodLog(
        timestamp: DateTime.parse(json["timestamp"]),
        moodIds: List<String>.from(json["moodIds"]),
      );
}
