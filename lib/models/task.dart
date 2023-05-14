class Task {
  final String title;
  final String description;
   bool isCompleted;

  Task({
    required this.title,
    required this.description,
     this.isCompleted=false,
  });

  void doneChange(){
    isCompleted= !isCompleted;
  }

  Task copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? date,
    bool? isCompleted,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
