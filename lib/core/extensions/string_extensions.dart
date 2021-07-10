extension StringExtensions on String {
  bool isNullOrWhiteSpace() {
    return this == null ||
        this.isEmpty ||
        this.trim() == "" ||
        this.trim() == "null";
  }
}
