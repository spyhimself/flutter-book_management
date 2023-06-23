import 'package:flutter/material.dart';
import 'Home.dart';
import 'Sqldb.dart';
class AddBook extends StatefulWidget {
  const AddBook({Key? key}) : super(key: key);
  @override
  State<AddBook> createState() => _AddBookState();
}
class _AddBookState extends State<AddBook> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _titre = TextEditingController();
    Sqldb sqldb = Sqldb();
    return Scaffold(
      appBar: AppBar(title: Text("Add Book"),),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: [
            TextField(
              controller: _titre,
              decoration: InputDecoration(
                  hintText: "Titre"
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: ()async{
//print(_titre.text);
                  int rep = await sqldb
                      .insertData("INSERT INTO 'books' (titre) VALUES ('${_titre.text}')");
                  print(rep);
                  if (rep>0){
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context)=>Home()),
                            (route) => false);
                  }
                },
                child: Icon(Icons.add,size: 40,))
          ],
        ),
      ),
    );
  }
}