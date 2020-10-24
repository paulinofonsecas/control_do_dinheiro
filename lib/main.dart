import 'package:control_do_dinheiro/utils/open_database.dart';
import 'package:flutter/cupertino.dart';

void main() async {
  await prepareDatabase();
  runApp(Container());
}
