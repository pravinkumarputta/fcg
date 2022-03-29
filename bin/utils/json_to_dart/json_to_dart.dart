import 'dart:io';

import 'model_generator.dart';

DartCode generateModel(String name, String filePath) {
  final classGenerator = ModelGenerator(name);
  final jsonRawData = File(filePath).readAsStringSync();
  DartCode dartCode = classGenerator.generateDartClasses(jsonRawData);
  return dartCode;
}
