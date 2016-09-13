# Safe `get-function()` for Sass [![Build Status](https://travis-ci.org/kaelig/sass-safe-get-function.svg?branch=master)](https://travis-ci.org/kaelig/sass-safe-get-function)

`safe-get-function` is a utility that allows you to write code using `get-function` today. It is particularly useful to authors of libraries, frameworks and other utilities who want to make their code compatible with past, present and future versions of Sass.

`call($name)` is deprecated in favor of `call(get-function($name))` with [the introduction of first-class functions in Sass 3.5.0](https://medium.com/@kaelig/sass-first-class-functions-6e718e2b5eb0).

[The official recommendation](http://blog.sass-lang.com/posts/809572-sass-35-release-candidate) is to update your code to get ready for Sass 4.0.0 and use `get-function` as soon as Sass 3.5.0 is released. Not only you'd have to wait for Sass 3.5.0 to get released, but you'd also be writing code that doesn't work in older versions of Sass. `safe-get-function` was created to allow authors to write code compatible with older and future versions at the same time.

## Usage

```scss
h1 {
  content: call(safe-get-function($name), $arguments...);
}
```

## Get Started

### 1. Get the code

You have a few options:

- A good ol’ copy-paste of [index.scss](index.scss) to your codebase
- or using npm `npm install sass-safe-get-function --save`
- or even bower `bower install kaelig/sass-safe-get-function --save`

### 2. Import the partial

```scss
@import 'path/to/sass-safe-get-function/index.scss';
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

## Resources

- [Making sense out of Sass 3.5.0 first-class functions](https://medium.com/@kaelig/sass-first-class-functions-6e718e2b5eb0) on Medium

## Acknowledgments

Thank you to [@chriseppstein](https://github.com/chriseppstein) for inspiring this library.
