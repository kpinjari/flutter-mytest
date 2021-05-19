import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:mytest/amplifyconfiguration.dart';
import 'package:mytest/screens/login_screen.dart';

void main() {
  // Add this line, to include the Auth plugin.
  //Amplify.addPlugin(AmplifyAuthCognito());
  runApp(
    MaterialApp(
      title: 'FinAXS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AmplifyTODO(),
    ),
  );
}

class AmplifyTODO extends StatefulWidget {
  AmplifyTODO({Key key}) : super(key: key);

  @override
  _AmplifyTODOState createState() => _AmplifyTODOState();
}

class _AmplifyTODOState extends State<AmplifyTODO> {
  bool _amplifyConfigured = false;
  //Amplify _amplifyInstance = Amplify();

  Future<void> _configureAmplify() async {
    try {
      //AmplifyAuthCognito auth = AmplifyAuthCognito();
      Amplify.addPlugins([AmplifyAuthCognito()]);
      await Amplify.configure(amplifyconfig);

      setState(() => _amplifyConfigured = true);
    } catch (e) {
      print(e);
      setState(() => _amplifyConfigured = false);
    }
    setState(() => _amplifyConfigured = true);
  }

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
