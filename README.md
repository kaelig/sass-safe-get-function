# Safe `get-function()` for Sass [![Build Status](https://travis-ci.org/kaelig/sass-safe-get-function.svg?branch=master)](https://travis-ci.org/kaelig/sass-safe-get-function)

`safe-get-function` is a utility that helps you write code compatible with Sass 3.3.x, 3.4.x, 3.5.x and up, as well as node-sass. It is particularly useful to authors of libraries, frameworks and advanced Sass utilities.

First-class functions were introduced in Sass 3.5.0, deprecating `call($name)` in favor of `call(get-function($name))`. The official recommendation is to update your code to use `get-function` right away to get ready for Sass 4.0.0, which unfortunately breaks in older versions of Sass. `safe-get-function` was created to allow authors to write code compatible with older and future versions at the same time.

## Get Started

### 1. Get the code

- A good ol’ copy-paste of [index.scss](index.scss) to your codebase
- or npm `npm install sass-safe-get-function --save`
- or even bower `bower install kaelig/sass-safe-get-function --save`

### 2. Import the partial

```scss
@import 'path/to/sass-get-function/index.scss';
```

### 3. Profit

Instead of `get-function`, use `safe-get-function`:

#### Before `safe-get-function`

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

#### With `safe-get-function`

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
