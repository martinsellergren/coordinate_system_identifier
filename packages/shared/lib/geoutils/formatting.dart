import 'package:coordinate_systems_data/data_model.dart';
import 'package:latlong_formatter/latlong_formatter.dart' as f;

extension LonLatFormatting on LonLat {
  String get formatAsDegrees =>
      f.LatLongFormatter('''{latd°m's.s"c} {lond°m's.s"c}''')
          .format(f.LatLong(lat, lon));

  String get formatAsDecimal =>
      f.LatLongFormatter('''{lat-d.ddddd}, {lon-d.ddddd}''')
          .format(f.LatLong(lat, lon));
}
