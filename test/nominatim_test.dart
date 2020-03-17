import 'package:flutter_test/flutter_test.dart';

import 'package:retina/utils/attitude.dart';
import 'package:retina/utils/nominatim.dart';

void main() async {
  test('getGlobalCoordinates test', () async {
    final testCoords = await getGlobalCoordinates(
      "nominatim.openstreetmap.org",
      "Information Technology Building McMaster",
    );
    var trueCoords = GlobalCoordinates(
      latitude: 43.258860150000004,
      longitude: -79.92078009725824,
    );
    expect(testCoords, trueCoords);
  });
}
