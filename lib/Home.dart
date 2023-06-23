import 'package:flutter/material.dart';
import 'Sqldb.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  Sqldb sqldb = Sqldb();
  Future<List<Map>> getAllBooks() async{
    List<Map> books = await sqldb.readData("SELECT * FROM 'books'");
    return books;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).pushNamed("addBook");
          },
          child: Icon(Icons.add,size: 30,)
          ,
        ),
        appBar: AppBar(title: Text("Home"),),
        body: FutureBuilder(
            future: getAllBooks(),
            builder: (ctx, snp){
              if(snp.hasData){
                return Container(
                  margin: EdgeInsets.all(10),
                  height: double.infinity,
                  child: ListView.builder(
                      itemCount: snp.data!.length ,
                      itemBuilder: (ctx, idx){
                        return Card(
                          child: ListTile(
                              leading: Icon(Icons.book, color: Colors.purple,) ,
                              title: Text("${snp.data![idx]['titre']}"),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(onPressed: null, child:
                                  Icon(Icons.edit, color: Colors.green,),),
                                  TextButton(onPressed: () async {
                                    setState(() async {
                                      int d = await sqldb
                                          .deleteData("DELETE FROM 'books' WHERE id=${snp.data![idx]['id']}");
                                          print(d);
                                    });
                                  }, child: Icon(Icons.delete,color:
                                  Colors.red,),)
                                ],

                              )
                          ),
                        );
                      }),
                );
              }else{
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}