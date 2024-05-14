import 'dart:io';

void main() {
  print('Enter the name of the file you want to read:');
  String fileName = stdin.readLineSync() ?? '';

  readFile(fileName);
}

void readFile(String fileName) {
  try {
    File file = File(fileName);
    if (!file.existsSync()) {
      print('File not found.');
      return;
    }

    List<String> lines = file.readAsLinesSync();
    print('File contents:');
    lines.forEach((line) => print(line));
  } catch (e) {
    print('Error reading file: $e');
  }
}
