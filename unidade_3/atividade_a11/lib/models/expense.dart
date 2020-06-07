class Expense {
  final int id;
  final String name;
  final int value;
  final int recurrence;

  Expense(this.id, this.name, this.value, this.recurrence);

  @override
  String toString() {
    return 'Expense{id: $id, name: $name, valor: $value, recurrence: $recurrence}';
  }

  Expense.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        value = json['valor'],
        recurrence = json['recurrence'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'valor': value,
        'recurrence': recurrence,
      };
}
