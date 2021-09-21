import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_websockets/Store.dart';
import 'package:hello_websockets/logic/cubit/cmd_loading_cubit.dart';
import 'package:hello_websockets/services/services.dart';
import 'package:hello_websockets/widgets/cmd_loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Make Money",
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    child: FutureBuilder<String>(
                        future: MyServices.getImage(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasData) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: InkWell(
                                    onTap: () => setState(() {}),
                                    child: Image.asset(
                                      snapshot.data ?? "",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Text(snapshot.error.toString());
                            }
                          } else {
                            return BlocProvider(
                              create: (context) => CmdLoadingCubit(),
                              child: CmdLoading(),
                            );
                          }
                        }),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Become a seller",
                    style: TextStyle(color: Colors.purple, fontSize: 26),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TabDots(
                    dotSize: 8.0,
                    color: Colors.purple.withOpacity(0.3),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  TabDots(
                    dotSize: 8.0,
                    color: Colors.purple.withOpacity(0.3),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  TabDots(
                    dotSize: 8.0,
                    color: Colors.purple,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Skip",
                      style: TextStyle(color: Colors.purple, fontSize: 22),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Store())),
                      child: ClipOval(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          color: Colors.purple,
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TabDots extends StatelessWidget {
  final double dotSize;
  final Color color;
  const TabDots({
    Key? key,
    required this.dotSize,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: dotSize,
        height: dotSize,
        color: color,
      ),
    );
  }
}
