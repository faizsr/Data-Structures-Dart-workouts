import 'dart:io';

class Node<T> {
  T? value;
  Node? next;

  Node({this.value, this.next});
}

class Stack {
  Node? top;

  push(value) {
    Node newNode = Node(value: value);
    if (top == null) {
      top = newNode;
      return;
    }
    newNode.next = top;
    top = newNode;
  }

  pop() {
    if (top == null) {
      print('List is empty');
      return;
    }
    var value = top!.value;
    top = top!.next;
    return value;
  }

  display() {
    Node? current = top;
    while (current != null) {
      stdout.write('${current.value} \t');
      if (current.next == null) {
        print('');
      }
      current = current.next;
    }
  }

  bool isEmpty() {
    return top == null;
  }

  removeNode(int value) {
    Stack stack = Stack();
    display();
    while (!isEmpty()) {
      var val = pop();
      if (val != value) {
        stack.push(val);
      }
    }
    stack.display();
  }

  String reverse(String str) {
    Stack stack = Stack();
    String reversed = '';
    for (int i = 0; i < str.length; i++) {
      stack.push(str[i]);
    }

    while (!stack.isEmpty()) {
      reversed += stack.pop().toString();
    }
    return reversed;
  }
}

void main(List<String> args) {
  Stack stack = Stack();

  stack.push(10);
  stack.push(20);
  stack.push(60);
  stack.push(30);
  stack.display();
  stack.pop();
  stack.display();
  print(stack.reverse('str'));
  stack.removeNode(20);
}
