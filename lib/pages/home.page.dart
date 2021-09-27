import 'package:bonus/pages/calcular.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  bool _male = true;
  double _progress = 150;
  int _counter = 45;
  int _counter2 = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _body(),
    );
  }

  _body() {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: _iconoM(),
            flex: 1,
          ),
          Expanded(
            child: _iconoF(),
            flex: 1,
          ),
        ],
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 1800,
            decoration: BoxDecoration(
              color: Colors.black45,
              border: Border.all(color: Colors.grey.shade900, width: 2.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(4, 4),
                ),
              ],
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              children: [
                Text(
                  "Estatura",
                  style: TextStyle(
                      fontSize: 18, color: Colors.white.withOpacity(0.7)),
                ),
                Text(
                  "${_progress.toInt()} cm",
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
                CupertinoSlider(
                    value: _progress,
                    min: 0.0,
                    max: 350.0,
                    onChanged: (value) {
                      setState(() {
                        _progress = value.roundToDouble();
                      });
                    }),
              ],
            ),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: _Peso(),
            flex: 1,
          ),
          Expanded(
            child: _Estatura(),
            flex: 1,
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {});
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Calculator(
                                  edad: _counter2,
                                  estatura: _progress,
                                  peso: _counter,
                                  genero: _male,
                                )));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.pink.shade600,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      textStyle: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold)),
                  child: const Text(
                    "Calcular",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )))
        ],
      )
    ]);
  }

  _iconoM() {
    return Container(
      decoration: BoxDecoration(
        color: _male ? Colors.black26 : Colors.black45,
        border: Border.all(color: Colors.grey.shade900, width: 2.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(4, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 200,
      child: IconButton(
          icon: const Icon(Icons.male, size: 180.0),
          tooltip: 'Hombre',
          onPressed: () {
            setState(() {
              _male = true;
              // ignore: avoid_print
              print(_male);
            });
          }),
    );
  }

  _iconoF() {
    return Container(
      decoration: BoxDecoration(
        color: !_male ? Colors.black26 : Colors.black45,
        border: Border.all(color: Colors.grey.shade900, width: 2.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(4, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 200,
      child: IconButton(
          icon: const Icon(Icons.female, size: 180.0),
          tooltip: 'Mujer',
          onPressed: () {
            setState(() {
              _male = false;
              // ignore: avoid_print
              print(_male);
            });
          }),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _Peso() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black45,
        border: Border.all(color: Colors.grey.shade900, width: 2.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(4, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Peso",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white.withOpacity(0.4),
              )),
          Text(
            "$_counter",
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (_counter > 0) {
                        _counter--;
                      }
                    });
                  },
                  tooltip: 'Desminuir',
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 40,
                  ),
                  backgroundColor: Colors.grey.shade700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  heroTag: "btn2",
                  onPressed: () {
                    setState(() {
                      _counter++;
                    });
                  },
                  tooltip: 'Incrementar',
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 40,
                  ),
                  backgroundColor: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _Estatura() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black45,
        border: Border.all(color: Colors.grey.shade900, width: 2.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(4, 4), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Edad",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white.withOpacity(0.4),
              )),
          Text(
            "$_counter2",
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  heroTag: "btn3",
                  onPressed: () {
                    setState(() {
                      if (_counter2 > 0) {
                        _counter2--;
                      }
                    });
                  },
                  tooltip: 'Desminuir',
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 40,
                  ),
                  backgroundColor: Colors.grey.shade700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  heroTag: "btn4",
                  onPressed: () {
                    setState(() {
                      _counter2++;
                    });
                  },
                  tooltip: 'Incrementar',
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 40,
                  ),
                  backgroundColor: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
