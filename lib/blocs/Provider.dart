import 'package:dash/dash.dart';

import 'BlendManager.dart';
import 'ListManager.dart';
import 'NavigationManager.dart';
import 'PostManager.dart';

part 'Provider.g.dart';

@BlocProvider.register(NavigationManager)
@BlocProvider.register(ListManager)
@BlocProvider.register(BlendManager)
@BlocProvider.register(PostManager)

abstract class Provider {}