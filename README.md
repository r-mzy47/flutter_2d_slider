# flutter_2d_slider

A Flutter 2D Slider package. Used to select from a range of 2-dimensional values with boundary.

![Gif](https://github.com/r-mzy47/flutter_2d_slider/blob/master/example.gif "flutter 2d slider")

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_2d_slider: ^0.1.0
```

## Usage

this slider has 4 required parameters. x position [posx], y position [posy], a callback for thumb location changes Function(double x, double y) [onChange] and thumb size [thumbSize].

[thumbWidget] is optional. so you can modify the thumb widget if you want.

whereas this widget has not any internal state management system. you have to control your x and y values using the [onChange] callback.

## Example 

```dart
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Offset offset;

  @override
  void initState() {
    offset = new Offset(50, 50);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter 2D Slider Demo"),
      ),
      body: Slider2D(
        offset: offset,
        onChange: (newOffset) {
          setState(() {
            offset = newOffset;
          });
        },
        thumbSize: 20,
      ),
    );
  }
}
```