import 'package:flutter/material.dart';
import 'package:flutter_bloc_teste/myhomepage_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
   _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  MyHomePageBloc bloc = MyHomePageBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar (
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('precione o botão para adicionar:',
              ),
              StreamBuilder(
                stream: bloc.output,
                builder: (context, snapshot) {
                return Text(
                  '${bloc.counter}',
                    style: Theme.of(context).textTheme.display1,
                );
              }
             ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: bloc.incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
    );
  }
}