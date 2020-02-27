import 'package:provider/provider.dart';

import 'models/room.dart';

final app_providers = [
  ChangeNotifierProvider(create: (context) => RoomModel()),
];
