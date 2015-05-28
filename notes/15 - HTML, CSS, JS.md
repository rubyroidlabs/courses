# HTML basics

HyperText Markup Language

HTML tags most commonly come in pairs like <h1> and </h1>, although some represent empty elements and so are unpaired, for example <img>.

Latests version is HTML5

The main idea is to define the structure with HTML tags and allow the user to read it even if the styles are bad.

## Markup

```
<!DOCTYPE html>
<html>
  <head>
    <title>This is a title</title>
  </head>
  <body>
    <p>Hello world!</p>
  </body>
</html>
```
The Document Type Declaration <!DOCTYPE html> is for HTML5. If a declaration is not included, various browsers will revert to "quirks mode" for rendering.

## Elements

General form:

```
<tag attribute1="value1" attribute2="value2">
  content 
</tag>
```
#### Main elements

div
span
p
b
br
h1 h2 h3 h4 h5 h6
a

#### Main attributes

id
class
data-

## DTD

```
HTML5
<!DOCTYPE html>

HTML4
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
```

## Template engines

HTML
ERB
HAML
SLIM

#CSS

Cascading Style Sheets

## Main parts

#### Selectors
ID
Classes
Pseudo-classes
Attributes selector

#### Declaration block

color
padding
margin
font-*
width
height

## Inline styles

style='color: red'

## Importance scheme

http://en.wikipedia.org/wiki/Cascading_Style_Sheets

## Specificity

http://en.wikipedia.org/wiki/Cascading_Style_Sheets

## Template engines

ScSS SaSS
postcss

# Javascript
Variables in JavaScript can be defined using the var keyword:[54]

```
var x; // defines the variable x, although no value is assigned to it by default
var y = 2; // defines the variable y and assigns the value of 2 to it
```

Consle log
```
console.log("Hello World!");
```

Recursion
```
function factorial(n) {
    if (n == 0) {
        return 1;
    }
    return n * factorial(n - 1);
}
```

Variadic function demonstration (arguments is a special variable).[57]

```
var sum = function() {
    var i, x = 0;
    for (i = 0; i < arguments.length; ++i) {
        x += arguments[i];
    }
    return x;
}
sum(1, 2, 3); // returns 6
```

Change HTML on the fly 

document
window

## Security

CORS

## Sugar
CoffeeScript

## Plugins


