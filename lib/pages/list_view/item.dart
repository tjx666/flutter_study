import 'dart:convert';

import 'package:flutter/foundation.dart';

class HackNewsItem {
  final String by;
  final int? descendants;
  final int id;
  final List<int>? kids;
  final int score;
  final int time;
  final String title;
  final String type;
  final String url;
  HackNewsItem({
    required this.by,
    required this.descendants,
    required this.id,
    required this.kids,
    required this.score,
    required this.time,
    required this.title,
    required this.type,
    required this.url,
  });

  HackNewsItem copyWith({
    String? by,
    int? descendants,
    int? id,
    List<int>? kids,
    int? score,
    int? time,
    String? title,
    String? type,
    String? url,
  }) {
    return HackNewsItem(
      by: by ?? this.by,
      descendants: descendants ?? this.descendants,
      id: id ?? this.id,
      kids: kids ?? this.kids,
      score: score ?? this.score,
      time: time ?? this.time,
      title: title ?? this.title,
      type: type ?? this.type,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'by': by,
      'descendants': descendants,
      'id': id,
      'kids': kids,
      'score': score,
      'time': time,
      'title': title,
      'type': type,
      'url': url,
    };
  }

  factory HackNewsItem.fromMap(Map<String, dynamic> map) {
    return HackNewsItem(
      by: map['by'],
      descendants: map['descendants']?.toInt(),
      id: map['id']?.toInt(),
      kids: List<int>.from(map['kids'] ?? []),
      score: map['score']?.toInt(),
      time: map['time']?.toInt(),
      title: map['title'],
      type: map['type'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HackNewsItem.fromJson(String source) =>
      HackNewsItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HackNewsItem(by: $by, descendants: $descendants, id: $id, kids: $kids, score: $score, time: $time, title: $title, type: $type, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HackNewsItem &&
        other.by == by &&
        other.descendants == descendants &&
        other.id == id &&
        listEquals(other.kids, kids) &&
        other.score == score &&
        other.time == time &&
        other.title == title &&
        other.type == type &&
        other.url == url;
  }

  @override
  int get hashCode {
    return by.hashCode ^
        descendants.hashCode ^
        id.hashCode ^
        kids.hashCode ^
        score.hashCode ^
        time.hashCode ^
        title.hashCode ^
        type.hashCode ^
        url.hashCode;
  }
}
