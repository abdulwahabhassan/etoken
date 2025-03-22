import 'package:etoken/assets/colors/color.dart';
import 'package:flutter/material.dart';

class DragButton extends StatefulWidget {
  const DragButton({super.key});

  @override
  State<StatefulWidget> createState() => _DragButtonState();
}

class _DragButtonState extends State<DragButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _position = 0.0;
  final double _containerWidth = 300.0;
  final double _containerHeight = 54.0;
  final double _circleDiameter = 46.0;
  final double _positionThreshold = 255.0;
  final double _paddingSize = 4;
  final int _animationFactorOne = 1;
  final double _multiplierFactorThree = 3.5;
  final double _multiplierFactorOne = 1.5;
  double get _dragThreshold =>
      _containerWidth - _circleDiameter - (_paddingSize * 2);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  void _animateBack() {
    _animation = Tween<double>(begin: _position, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linearToEaseOut),
    )..addListener(() {
      setState(() {
        _position = _animation.value;
      });
    });

    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    double buttonHeight =
        _containerHeight -
        (((_containerHeight - _circleDiameter) / _positionThreshold) *
            _position);

    double buttonWidth =
        _containerWidth -
        ((((_containerWidth + (_paddingSize * 2)) - _containerWidth) /
                _positionThreshold) *
            _position);

    double padding =
        _paddingSize - ((_paddingSize / _positionThreshold) * _position);

    return Center(
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
          color: Color.lerp(
            Colors.white.withAlpha(50),
            Colors.white.withAlpha(255),
            (_position / _positionThreshold) * _animationFactorOne,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  setState(() {
                    _position += details.delta.dx;
                    _position = _position.clamp(0.0, _dragThreshold);
                  });
                },
                onHorizontalDragEnd: (details) {
                  if (_position < _dragThreshold) {
                    _animateBack();
                  }
                },
                child: Container(
                  width: _circleDiameter + _position,
                  height: _circleDiameter,
                  margin: EdgeInsets.only(left: padding, right: padding),
                  decoration: BoxDecoration(
                    color: Color.lerp(
                      bluue,
                      Colors.white.withAlpha(100),
                      (_position / _positionThreshold) * _animationFactorOne,
                    ),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: _position,
                          child: Container(
                            height: _circleDiameter,
                            width: _circleDiameter,
                            decoration: BoxDecoration(
                              color: Color.lerp(
                                bluue.withAlpha(100),
                                Colors.white,
                                (_position / _positionThreshold) *
                                    _animationFactorOne,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.east_rounded,
                                color: Color.lerp(
                                  Colors.white,
                                  bluue,
                                  (_position / _positionThreshold) *
                                      _animationFactorOne,
                                ),
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Text(
              "Slide In",
              style: TextStyle(
                color: Color.lerp(
                  Colors.white.withAlpha(255),
                  Colors.white.withAlpha(0),
                  (_position * _multiplierFactorThree / _positionThreshold) *
                      _animationFactorOne,
                ),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            Positioned(
              right: 24,
              child: Icon(
                Icons.keyboard_double_arrow_right_rounded,
                color: Color.lerp(
                  Colors.white.withAlpha(255),
                  Colors.white.withAlpha(0),
                  (_position * _multiplierFactorOne / _positionThreshold) *
                      _animationFactorOne,
                ),
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
