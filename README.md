# Flutter Code Generator
Advanced dart/flutter dev tool for generating page, widget, model, repository, and bloc etc.

## Installing and updating fcg
Globally install fcg using pub:
```
dart pub global activate fcg
```

## Commands
```
Usage: fcg <command> [arguments]

Global options:
-h, --help    Print this usage information.

Available commands:
  bloc         (b)      Create flutter bloc.
  model        (m)      Create flutter model.
  page         (p)      Create flutter page.
  repository   (r)      Create flutter repository.
  widget       (w)      Create flutter widget.
```

### Bloc Command
```
Option name is mandatory.

Usage: fcg bloc --name <path>/bloc_name
-h, --help                Print this usage information.
-n, --name (mandatory)    Create bloc with given name.
```

### Model Command
```
Option name is mandatory.

Usage: fcg model --name <path>/model_name [--dir-name <value>] [--with-dir] [--source=<json_file_path>]
-h, --help                Print this usage information.
-n, --name (mandatory)    Create model with given name.
    --source              Create model folder with json using json_to_dart plugin.
    --dir-name            Create model folder with given name.
                          (defaults to "models")
    --with-dir            It creates flutter model with directory.
```

### Page Command
```
Option name is mandatory.

Usage: fcg page --name <path>/page_name [--suffix <value>] [--with-dir]
-h, --help                Print this usage information.
-n, --name (mandatory)    Create page with given name.
    --suffix              Appends the given suffix at the end of file.
                          (defaults to "page")
    --with-dir            It creates flutter page with directory.
```

### Repository Command
```
Option name is mandatory.

Usage: fcg repository --name <path>/repository_name
-h, --help                Print this usage information.
-n, --name (mandatory)    Create repository with given name.
```

### Widget Command
```
Option name is mandatory.

Usage: fcg widget --name <path>/widget_name [--stateful] [--with-dir]
-h, --help                Print this usage information.
-n, --name (mandatory)    Create widget with given name.
    --stateful            Create stateful widget.
    --with-dir            It creates flutter widget with directory.
```

# Credits

[JSON to Dart by Javier Lecuona](https://javiercbk.github.io/json_to_dart/).

# License

[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).
