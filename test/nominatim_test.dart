import 'package:flutter_test/flutter_test.dart';

import 'package:retina/utils/attitude.dart';
import 'package:retina/utils/nominatim.dart';

void main() async {
  test('getGlobalCoordinates test', () async {
    final testn = await getNominatimOutput(
      "nominatim.openstreetmap.org",
      "Information Technology Building McMaster",
    );
    GlobalCoordinates testCoords= getGlobalCoordinate(testn);
    var trueCoords = GlobalCoordinates(
      latitude: 43.258860150000004,
      longitude: -79.92078009725824,
    );
    expect(testCoords, trueCoords);
  });
}
