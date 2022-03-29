import 'package:args/command_runner.dart';

import '../../utils/common_utils.dart';
import 'model_template.dart';

class ModelCommand extends Command {
  // The [name] and [description] properties must be defined by every
  // subclass.
  @override
  final name = 'model';

  @override
  final description = '(m)    Create flutter model.';

  @override
  final invocation =
      'fcg model --name <path>/model_name [--dir-name <value>] [--with-dir] [--source=<json_file_path>]';

  @override
  final aliases = ['m'];

  ModelCommand() {
    // we can add command specific arguments here.
    // [argParser] is automatically created by the parent class.
    argParser.addOption(
      'name',
      abbr: 'n',
      mandatory: true,
      help: 'Create model with given name.',
    );
    argParser.addOption(
      'source',
      defaultsTo: null,
      help: 'Create model folder with json using json_to_dart plugin.',
    );
    argParser.addOption(
      'dir-name',
      defaultsTo: 'models',
      help: 'Create model folder with given name.',
    );
    argParser.addFlag(
      'with-dir',
      negatable: false,
      help: 'It creates flutter model with directory.',
    );
  }

  // [run] may also return a Future.
  @override
  void run() {
    // [argResults] is set before [run()] is called and contains the flags/options
    // passed to this command.
    _createModel(
      argResults!['name'].toLowerCase(),
      argResults!['with-dir'],
      argResults!['dir-name'].toLowerCase(),
      argResults!['source']?.toLowerCase(),
    );
  }

  void _createModel(String name, bool withDir, String dirName, String? source) {
    if (withDir) {
      // create model with directory
      _createModelWithDir(name, dirName, source);
    } else {
      // create model without directory
      _createModelWithoutDir(name, source);
    }
  }

  void _createModelWithDir(String name, String dirName, String? source) {
    ModelTemplate().createDir(
      name,
      dirName: dirName,
      source: source,
    );
  }

  void _createModelWithoutDir(String name, String? source) {
    // extract root path from name
    var namePath = CommonUtils.extractNamePath(name);
    ModelTemplate().create(
      namePath.name,
      path: namePath.path,
      source: source,
    );
  }
}
