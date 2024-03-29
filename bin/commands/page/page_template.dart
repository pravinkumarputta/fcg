import 'dart:io';
import '../../utils/common_utils.dart';
import '../../utils/extensions.dart';

class PageTemplate {
  final _template = '''
import 'package:flutter/material.dart';

class @Name extends StatefulWidget {
  const @Name({Key? key}) : super(key: key);

  static route() => '@Name';

  @override
  State<@Name> createState() => _@NameState();
}

class _@NameState extends State<@Name> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("@Name")
      ),
      body: const Center(
        child: Text("Welcome to @Name"),
      ),
    );
  }
}
  ''';

  final _exportTemplate = '''
export '@name.dart';
  ''';

  void create(String name, {String? path, String suffix = 'page'}) {
    var pageName = (name + '_' + suffix)
        .split('_')
        .map((e) => e.capitalize())
        .toList()
        .join('');

    // use current dir if not provided
    path ??= Directory.current.path;
    Directory(path).createSync(recursive: true);

    // file path
    var filePath = path + '/' + name + '_' + suffix + '.dart';

    File(filePath)
      ..createSync()
      ..writeAsStringSync(_template.replaceAll('@Name', pageName));

    print('Page created at ' + filePath);
  }

  void createDir(String name, {String suffix = 'page'}) {
    // extract root path from name
    var namePath = CommonUtils.extractNamePath(name);
    name = namePath.name;

    // set current dir path
    var path = namePath.path;

    // create root dir
    var pageDirPath = path + '/' + name + '_' + suffix;
    Directory(pageDirPath).createSync(recursive: true);

    // create page
    create(name, path: pageDirPath);

    // create export template
    var pageName = name + '_' + suffix;

    // page export file path
    var pageExportFilePath = pageDirPath + '/$name.dart';

    // page export write
    File(pageExportFilePath)
      ..createSync()
      ..writeAsStringSync(_exportTemplate.replaceAll('@name', pageName));

    print('Page export file created at ' + pageExportFilePath);
  }
}
