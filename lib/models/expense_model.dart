class ExpenseList {
  final String id;
  final String name;
  final String description;
  final DateTime createdAt;
  final int itemCount;

  ExpenseList({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.itemCount,
  });

  factory ExpenseList.fromJson(Map<String, dynamic> json) {
    return ExpenseList(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      itemCount: json['itemCount'] ?? 0,
    );
  }
}

class ExpenseItem {
  final String id;
  final String listId;
  final String title;
  final double amount;
  final DateTime date;
  final String? category;
  final String? notes;
  final List<String> attachments;

  ExpenseItem({
    required this.id,
    required this.listId,
    required this.title,
    required this.amount,
    required this.date,
    this.category,
    this.notes,
    this.attachments = const [],
  });

  factory ExpenseItem.fromJson(Map<String, dynamic> json) {
    return ExpenseItem(
      id: json['id'] ?? '',
      listId: json['listId'] ?? '',
      title: json['title'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
      date: DateTime.tryParse(json['date'] ?? '') ?? DateTime.now(),
      category: json['category'],
      notes: json['notes'],
      attachments: List<String>.from(json['attachments'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'listId': listId,
      'title': title,
      'amount': amount,
      'date': date.toIso8601String(),
      'category': category,
      'notes': notes,
      'attachments': attachments,
    };
  }
}