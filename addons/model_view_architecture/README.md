# Model View Architecture

_This is typically a plugin that you will include early on in development.  This is structurally a paradigm shift from more traditional styles of development in Godot._

The basic idea of this plugin is to provide a framework for developing Godot projects using a model view architecture. To begin, let's go over the reasons why you would want to build your project this way.

## Benefits

- Data-oriented design lends itself well to serialization, making saving the game state trivial in most cases.
- Data-oriented design leads to faster iteration and easier data organization (data can be sourced from json, spreadsheets, etc)
- Data-oriented design leads to less subclassing.
- Data is separated from the view, reducing coupling and allowing for greater flexibility in your code.


For most user designed classes, you will have a resource that extends from the `Model` class provided in this repo. The model class has several methods built in that run automatically (unless overridden - warnings are provided for these methods in the documentation comments).  These methods are typically used for assembling 