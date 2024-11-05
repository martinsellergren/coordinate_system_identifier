import 'package:latlong_formatter/latlong_formatter.dart' as f;

import '../coordinate_system_data/model.dart';

extension LonLatFormatting on LonLat {
  String get formatAsDegrees =>
      f.LatLongFormatter('''{latd°m's.s"c} {lond°m's.s"c}''')
          .format(f.LatLong(lat, lon));

  String get formatAsDecimal =>
      f.LatLongFormatter('''{lat-d.ddddd}, {lon-d.ddddd}''')
          .format(f.LatLong(lat, lon));
}
