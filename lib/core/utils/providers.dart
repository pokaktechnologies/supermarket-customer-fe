import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:supermarket_fe/providers/home_provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => HomeProvider()),
];
