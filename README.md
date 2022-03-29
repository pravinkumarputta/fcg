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
Usage: fcg bloc [arguments]
-h, --help                Print this usage information.
-n, --name (mandatory)    Create bloc with given name or full path.
```

### Model Command
```
Usage: fcg model [arguments]
-h, --help                Print this usage information.
-n, --name (mandatory)    Create model with given name or full path.
    --source              Create model folder with json using json_to_dart plugin.
    --dir-name            Create model folder with given name.
                          (defaults to "models")
    --with-dir            It creates flutter model with directory.
```

### Page Command
```
Usage: fcg page [arguments]
-h, --help                Print this usage information.
-n, --name (mandatory)    Create page with given name or full path.
    --suffix              Appends the given suffix at the end of file.
                          (defaults to "page")
    --with-dir            It creates flutter page with directory.
```

### Repository Command
```
Usage: fcg repository [arguments]
-h, --help                Print this usage information.
-n, --name (mandatory)    Create repository with given name or full path.
```

### Widget Command
```
Usage: fcg widget [arguments]
-h, --help                Print this usage information.
-n, --name (mandatory)    Create widget with given name or full path.
    --stateful            Create stateful widget.
    --with-dir            It creates flutter widget with directory.
```

# License

[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).
