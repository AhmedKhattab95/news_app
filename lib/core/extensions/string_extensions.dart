extension StringExtensions on String {
  bool isNullOrWhiteSpace() {
    return this == null ||
        this.isEmpty ||
        this.trim() == "" ||
        this.trim() == "null";
  }

  String captalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
