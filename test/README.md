# Test

## Unit tests

Unit tests check that the internals of this library work as expected.

For example:

- initializing the module
- throwing errors and warnings where appropriate
- failing compilation when appropriate

### Working locally

Run tests every time a file changes:

```bash
$ gem install filewatcher
$ filewatcher '**/*.{scss,rb}' 'test/spec.rb' --dontwait
```

When tests fail, the CSS gets output in `test/error.css`.
