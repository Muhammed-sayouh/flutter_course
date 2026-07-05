import 'package:get/get.dart';

class Translation extends Translations {
  final Map<String, String> ar;
  final Map<String, String> en;

  Translation(this.ar, this.en);
  @override
  Map<String, Map<String, String>> get keys => {'ar': ar, 'en': en};
}
