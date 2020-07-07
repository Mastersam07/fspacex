import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fspacex/blocs/home/home.dart';
import 'package:fspacex/blocs/simple_delegate.dart';
import 'package:fspacex/views/home_screen.dart';

void main() {
  BlocSupervisor.delegate = MySimpleBlocDelegate();

  runApp(MyApp());
}

// String query = r'''
//   query {
//     characters(page: 1) {
//       results {
//         id
//         name
//         status
//       }
//     }
//   }
// ''';

String query = r'''
  {
  launchesPast {
    id
    mission_name
    links {
      flickr_images
      mission_patch_small
    }
    rocket {
      rocket {
        name
      }
    }
    launch_date_utc
  }
}
''';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FspaceX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc()..add(FetchHomeData(query)),
        child: HomeScreen(),
      ),
    );
  }
}
