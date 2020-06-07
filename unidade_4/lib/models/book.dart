class Book {
  final int id;
  final String name;
  final String author;
  final String status;

  Book(
    this.id,
    this.name,
    this.author,
    this.status,
  );

  @override
  String toString() {
    return 'Livro{id: $id, nome: $name, autor: $author, status: $status}';
  }

  Book.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        author = json['author'],
        status = json['status'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'author': author,
        'status': status,
      };
}
