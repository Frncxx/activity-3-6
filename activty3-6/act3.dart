import 'dart:io';

void main() {
  
  String inputFilePath = 'input.txt';
  String outputFilePath = 'output.txt';

  
  List<int> numbers = readFile(inputFilePath);


  int sum = calculateSum(numbers);


  writeSum(outputFilePath, sum);
}

List<int> readFile(String filePath) {
  File file = File(filePath);
  List<int> numbers = [];

  try {
    file.readAsLinesSync().forEach((line) {
      numbers.add(int.parse(line));
    });
  } catch (e) {
    print("Error reading file: $e");
  }

  return numbers;
}

int calculateSum(List<int> numbers) {
  int sum = 0;
  numbers.forEach((number) {
    sum += number;
  });
  return sum;
}

void writeSum(String filePath, int sum) {
  File file = File(filePath);

  try {
    file.writeAsStringSync('Sum of numbers: $sum');
    print('Sum has been written to $filePath');
  } catch (e) {
    print("Error writing file: $e");
  }
}
