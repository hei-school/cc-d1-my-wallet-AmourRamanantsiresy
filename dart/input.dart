import 'dart:io';

String input(String text) {
  stdout.write(text);
  String? value = stdin.readLineSync();
  return value ?? "";
}
