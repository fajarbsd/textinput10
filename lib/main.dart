import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
    title: "Text Input",
  ));
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
String? teks="";
TextEditingController controller = TextEditingController(); //controller clear inputan setelah submit

void _alertdialog(String str){ //method menampilkan dialog
  if(str.isEmpty) return;

  AlertDialog alertDialog = AlertDialog(
    content: Text(str, style: TextStyle(fontSize: 20.0),),
  );

  showDialog(builder: (context) => alertDialog, context: context);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("INPUT TEXT, ALERT DIALOG & SNACKBAR"),
        backgroundColor: Colors.purple,),
      
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              controller: controller, //init controller clear inputan
              decoration:const InputDecoration(
              hintText: "Tulis di sini untuk teks",
              ),
              onSubmitted: (String str){
                setState(() {
                  teks=str + '\n' + teks!; //menambah teks tanpa menghilangkan str teks sebelumnya
                  controller.text=""; //penggunaan controller clear inputan
                });
              },
            ),
            Text(teks!, style: const TextStyle(fontSize: 20.0),),

            TextField(
              controller: controller, //init controller clear inputan
              decoration:const InputDecoration(
              hintText: "Tulis untuk alert",
              ),
              onSubmitted: (String str){
                _alertdialog(str);
              },
            ),
            
            
          ]
        ),),
    );
  }
}