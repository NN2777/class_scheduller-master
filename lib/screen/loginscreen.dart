import 'package:class_scheduler/screen/home_api.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      home: Scaffold(
          appBar: AppBar(title: Text('Login')),
          body: Container(
            color: Theme.of(context).primaryColorDark,
            child: Column(
              children: [
                Card(
                  elevation: 8,
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(labelText: 'Email'),
                        ),
                        TextField(
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(labelText: 'Password'),
                        ),
                        ElevatedButton(onPressed: null, child: Text('Enter'))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
