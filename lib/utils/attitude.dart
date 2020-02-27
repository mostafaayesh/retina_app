import 'dart:math';

enum Direction {
  FORWARD,
  RIGHT,
  BACKWARD,
  LEFT,
}

enum CardinalDirection {
  NORTH,
  NORTHEAST,
  EAST,
  SOUTHEAST,
  SOUTH,
  SOUTHWEST,
  WEST,
  NORTHWEST,
}

// TODO: Accept room and user models instead of coordinates
double getDistance(x1, y1, x2, y2) => sqrt((pow(x1-x2, 2)) + pow(y1-y2, 2));

// TODO: Implement real direction calculation
CardinalDirection getDirection(x1, y1, x2, y2, cardinalDirection) => CardinalDirection.NORTH;
