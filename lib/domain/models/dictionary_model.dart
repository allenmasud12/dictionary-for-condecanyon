class DictionaryModel {
  int? id;
  String word;
  String meaning;
  String grammar;
  String example;
  String synonyms;
  String antonyms;
  String usage;
  String pronunciation;
  String etymology;
  String relatedWords;
  String commonMistakes;
  String level;
  String frequency;
  String notes;
  String category;
  String others;
  int fav;
  int read;

  DictionaryModel({
    this.id,
    required this.word,
    required this.meaning,
    required this.grammar,
    required this.example,
    required this.synonyms,
    required this.antonyms,
    required this.usage,
    required this.pronunciation,
    required this.etymology,
    required this.relatedWords,
    required this.commonMistakes,
    required this.level,
    required this.frequency,
    required this.notes,
    required this.category,
    required this.others,
    this.fav = 0,
    this.read = 0,
  });

  /// Convert a DictionaryModel into a Map (for database)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'word': word,
      'meaning': meaning,
      'grammar': grammar,
      'example': example,
      'synonyms': synonyms,
      'antonyms': antonyms,
      'usage': usage,
      'pronunciation': pronunciation,
      'etymology': etymology,
      'related_words': relatedWords,
      'common_mistakes': commonMistakes,
      'level': level,
      'frequency': frequency,
      'notes': notes,
      'category': category,
      'others': others,
      'fav': fav,
      'read': read,
    };
  }

  /// Convert a Map into a DictionaryModel (for fetching data from database)
  factory DictionaryModel.fromMap(Map<String, dynamic> map) {
    return DictionaryModel(
      id: map['id'] as int?,
      word: map['word'] as String? ?? '',
      meaning: map['meaning'] as String? ?? '',
      grammar: map['grammar'] as String? ?? '',
      example: map['example'] as String? ?? '',
      synonyms: map['synonyms'] as String? ?? '',
      antonyms: map['antonyms'] as String? ?? '',
      usage: map['usage'] as String? ?? '',
      pronunciation: map['pronunciation'] as String? ?? '',
      etymology: map['etymology'] as String? ?? '',
      relatedWords: map['related_words'] as String? ?? '',
      commonMistakes: map['common_mistakes'] as String? ?? '',
      level: map['level'] as String? ?? '',
      frequency: map['frequency'] as String? ?? '',
      notes: map['notes'] as String? ?? '',
      category: map['category'] as String? ?? '',
      others: map['others'] as String? ?? '',
      fav: map['fav'] as int? ?? 0,
      read: map['read'] as int? ?? 0,
    );
  }
}
