import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive_new_version/firebase_options.dart';


import 'assets/constants/routes.dart';
import 'assets/theme/theme.dart';
import 'features/authentication/presentation/pages/login_bloc/login_bloc.dart';

import 'features/notes/notes/data/repository/notes.dart';
import 'features/notes/notes/presentation/bloc/notes/notes_bloc.dart';
import 'features/tasks/data/repository/task.dart';
import 'features/tasks/presentation/bloc/task_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (context) => TaskBloc(response: TaskRepository())),

      BlocProvider(create: (context)=>NoteBloc(repository: NoteRepository(),),),
      BlocProvider(create: (context)=>LoginBloc(),),
      //BlocProvider(create: (context)=>SignUpBloc(),),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productive',
      theme: AppTheme.darkTheme(),
      navigatorKey: _navigatorKey,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
    ),
  );
}
