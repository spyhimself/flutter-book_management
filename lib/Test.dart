import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book_management/Sqldb.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  Sqldb sqldb = Sqldb();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Test"),),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(children: [
            ElevatedButton(onPressed: () async {
              int rep = await sqldb.insertData("INSERT INTO 'books' (titre) VALUES ('Django')");
              print(rep);
            }
                , child: Text("INSERT")
            ),
            MaterialButton(
              color: Colors.purple,
              textColor: Colors.white,
              onPressed: () async {
                List<Map> rep = await sqldb.readData("SELECT * FROM 'books'");
                print("$rep");
              },
              child: Text("READ"),
            ),
            ElevatedButton(onPressed: () async {
              int rep = await sqldb.deleteData("DELETE FROM 'books' WHERE titre='Django'");
              print(rep);
            }, child: Text("DELETE")),
          ],),
        ),
      )
    );
  }

}