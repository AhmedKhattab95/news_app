extension StringExtensions on String {
  bool isNullOrWhiteSpace() {
    return this == null ||
        this.isEmpty ||
        this.trim() == "" ||
        this.trim() == "null";
  }

  String captalize() {
    if(this.length < 2)
      return this.toUpperCase();
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
