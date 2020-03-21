import 'package:provider/provider.dart';

import 'package:retina/models/room.dart';

final app_providers = [
  ChangeNotifierProvider(create: (context) => RoomNotifier()),
];
