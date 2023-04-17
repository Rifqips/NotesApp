import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Note {
  final int? id;
  final String title;
  final String description;
  final DateTime time;
  Note({
    this.id,
    required this.title,
    required this.description,
    required this.time,
  });


  

  Note copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? time,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'time': time.millisecondsSinceEpoch,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] as String,
      description: map['description'] as String,
      time: DateTime.fromMillisecondsSinceEpoch(int.parse(map['time'])),
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source) as Map<String, dynamic>);
}
