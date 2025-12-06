class Todo{
  final String id;
  final String description;
  final bool isDone;

  Todo({required this.id, required this.description, this.isDone = false});
}