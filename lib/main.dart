import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Text Input",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? teks = "";
  TextEditingController controllerInput =
      TextEditingController(); //controller clear inputan setelah submit
  TextEditingController controllerAlert = TextEditingController();
  TextEditingController controllerSnackbar = TextEditingController();

  @override
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  void _snackbar(String str) {
    if (str.isEmpty) return;

    _scaffoldState.currentState!.showSnackBar(SnackBar(
      content: Text(
        str,
        style: TextStyle(fontSize: 20.0),
      ),
      duration: Duration(seconds: 2),
    ));
  }

  void _alertdialog(String str) {
    //method menampilkan dialog
    if (str.isEmpty) return;

    AlertDialog alertDialog = AlertDialog(
      content: Text(
        str,
        style: TextStyle(fontSize: 20.0),
      ),
      actions: <Widget>[
        RaisedButton(
            color: Colors.purple,
            child: Text(
              "Oke",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
            })
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: const Text("INPUT TEXT, ALERT DIALOG & SNACKBAR"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Column(children: <Widget>[
          TextField(
            controller: controllerInput, //init controller clear inputan
            decoration: const InputDecoration(
              hintText: "Tulis di sini untuk teks",
            ),
            onSubmitted: (String str) {
              setState(() {
                teks = str +
                    '\n' +
                    teks!; //menambah teks tanpa menghilangkan str teks sebelumnya
                controllerInput.text = ""; //penggunaan controller clear inputan
              });
            },
          ),
          Text(
            teks!,
            style: const TextStyle(fontSize: 20.0),
          ),
          TextField(
            controller: controllerAlert, //init controller clear inputan
            decoration: const InputDecoration(
              hintText: "Tulis untuk snackbar",
            ),
            onSubmitted: (String str) {
              _alertdialog(str);
              controllerAlert.text = "";
            },
          ),
          TextField(
            controller: controllerSnackbar, //init controller clear inputan
            decoration: const InputDecoration(
              hintText: "Tulis untuk snackbar",
            ),
            onSubmitted: (String str) {
              _snackbar(str);
              controllerSnackbar.text = "";
            },
          ),
        ]),
      ),
    );
  }
}
