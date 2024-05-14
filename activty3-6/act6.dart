class Stack<T> {
  List<T> _items = [];

  // Push an element onto the stack
  void push(T item) {
    _items.add(item);
  }

  // Pop an element from the stack
  T? pop() {
    if (isEmpty()) {
      return null;
    }
    return _items.removeLast();
  }

  // Check if the stack is empty
  bool isEmpty() {
    return _items.isEmpty;
  }
}

void main() {
  Stack<int> stack = Stack<int>();

  // Push elements onto the stack
  stack.push(2);
  stack.push(3);
  stack.push(1);

  // Pop elements from the stack and print them
  print(stack.pop()); // Output: 3
  print(stack.pop()); // Output: 2
  print(stack.pop()); // Output: 1

  // Check if the stack is empty
  print(stack.isEmpty()); // Output: true
}
