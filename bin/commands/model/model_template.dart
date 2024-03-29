import 'dart:io';
import '../../utils/common_utils.dart';
import '../../utils/extensions.dart';
import '../../utils/json_to_dart/json_to_dart.dart';

class ModelTemplate {
  final _template = '''
import 'package:equatable/equatable.dart';

class @Name extends Equatable {
  final int field1;
  final String field2;

  const @Name({
    required this.field1,
    required this.field2,
  });

  Map<String, dynamic> toJson() {
    return {
      'field1': field1,
      'field2': field2,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return const @Name(
      field1: json['field1'],
      field2: json['field2'],
    );
  }

  @override
  List<Object?> get props => [
    field1,
    field2,
  ];

  @override
  String toString() {
    return \'''
    @Name({
      field1: \$field1,
      field2: \$field2,
    })
    \''';
  }
}
  ''';

  final _exportTemplate = '''
export '@name.dart';
  ''';

  void create(String name, {String? path, String? source}) {
    var modelName =
        name.split('_').map((e) => e.capitalize()).toList().join('');

    // use current dir if not provided
    path ??= Directory.current.path;
    Directory(path).createSync(recursive: true);

    // file path
    var filePath = path + '/' + name + '.dart';

    if (source == null) {
      File(filePath)
        ..createSync()
        ..writeAsStringSync(_template.replaceAll('@Name', modelName));
    } else {
      var dartCode = generateModel(modelName, source);
      var finalCode = '''
import 'package:equatable/equatable.dart';

${dartCode.code}
  ''';
      File(filePath)
        ..createSync()
        ..writeAsStringSync(finalCode);
    }

    print('Model created at ' + filePath);
  }

  void createDir(String name, {String dirName = 'models', String? source}) {
    // extract root path from name
    var namePath = CommonUtils.extractNamePath(name);
    name = namePath.name;

    // set current dir path
    var path = namePath.path;

    // create root dir
    var modelDirPath = path + '/' + dirName;
    Directory(modelDirPath).createSync(recursive: true);

    // create model
    create(name, path: modelDirPath, source: source);

    // model export file path
    var modelExportFilePath = modelDirPath + '/$dirName.dart';

    // model export write
    File(modelExportFilePath)
      ..createSync()
      ..writeAsStringSync(_exportTemplate.replaceAll('@name', name));

    print('Model export file created at ' + modelExportFilePath);
  }
}
