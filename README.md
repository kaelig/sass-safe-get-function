# Safe `get-function()` for Sass [![Build Status](https://travis-ci.org/kaelig/sass-safe-get-function.svg?branch=master)](https://travis-ci.org/kaelig/sass-safe-get-function)

safe-get-function is a small utility that helps you write code using `get-function`, compatible with Sass 3.3.x, 3.4.x, 3.5.x and up, as well as node-sass.

First class functions were introduced in Sass 3.5.0, deprecating `call($name)` in favor of `call(get-function($name))`.

## Without `safe-get-function`

```scss
@function foo($x) { @return $x; }

h1 {
  @if (function-exists('get-function')) {
    content: call(get-function('foo'), 'Only displays in Sass 3.5.0 and up');
  } @else {
    content: call('foo', 'Only displays in Sass 3.3.x and 3.4.x');
  }
}
```

## With `safe-get-function`

```scss
@import 'path/to/sass-get-function/index.scss';
@function foo($x) { @return $x; }

h1 {
  content: call(safe-get-function('foo'), 'Displays in Sass 3.3.x and up!');
}
```

----

## Running tests

Clone the repository, then:

```
gem install bundler
npm install
npm test
```

## Acknowledgments

Thank you to @chriseppstein for inspiring this library.
