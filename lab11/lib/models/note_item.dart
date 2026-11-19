import 'dart:convert';

class NoteItem {
  final String id;
  final String title;
  final String dateText;
  final bool isCompleted;

  const NoteItem({
    required this.id,
    required this.title,
    required this.dateText,
    this.isCompleted = false,
  });

  NoteItem copyWith({bool? isCompleted}) => NoteItem(
        id: id,
        title: title,
        dateText: dateText,
        isCompleted: isCompleted ?? this.isCompleted,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'dateText': dateText,
        'isCompleted': isCompleted,
      };

  factory NoteItem.fromJson(Map<String, dynamic> json) => NoteItem(
        id: (json['id'] as String?) ?? '',
        title: (json['title'] as String?) ?? '',
        dateText: (json['dateText'] as String?) ?? '',
        isCompleted: (json['isCompleted'] as bool?) ?? false,
      );

  static String encodeList(List<NoteItem> notes) =>
      jsonEncode(notes.map((n) => n.toJson()).toList());

  static List<NoteItem> decodeList(String? source) {
    if (source == null || source.isEmpty) return [];
    try {
      final data = jsonDecode(source) as List<dynamic>;
      return data
          .map((e) => NoteItem.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return [];
    }
  }
}
