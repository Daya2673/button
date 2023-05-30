import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: button(),));
}
FirebaseFirestore firestore = FirebaseFirestore.instance;
class button extends StatefulWidget {

  const button({Key? key}) : super(key: key);


  @override
  State<button> createState() => _buttonState();
}

class _buttonState extends State<button> {

  void create() async{
    try{
      await firestore.collection('user').doc('testuser').set({
        'firstname': 'john',
        'lastname': 'peter',
        'age': '25',
      });
    }
    catch(e){
      print(e);
    }
  }
  void update() async {
    try {
      firestore.collection('user').doc('testuser').set({
        'firstname': 'john',
        'lastname': 'peter',
        'age': '25',
      });
    }
    catch (e) {
      print(e);
    }
  }
    void read() async {
      DocumentSnapshot documentSnapshot;
      try {
        documentSnapshot =
        await firestore.collection('user').doc('testuser').get();
        print(documentSnapshot.data());
      } catch (e) {
        print(e);
      }
    }
    void delete() async {
      try {
        firestore.collection('user').doc('testname').delete();
      } catch (e) {
        print(e);
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Crud With Firebase'),
      ),
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){create();},
                child: Text('CREATE',style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold,color: Colors.yellowAccent,),)),
            SizedBox(height: 10,),
            TextButton(onPressed: (){update();},
                child: Text('UPDATE',style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold,color: Colors.yellowAccent,),)),
            SizedBox(height: 10,),
            TextButton(onPressed: (){read();},
                child: Text('RAED',style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold,color: Colors.yellowAccent,),)),
            SizedBox(height: 10,),
            TextButton(onPressed: (){delete();},
                child: Text('DELETE',style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold,color: Colors.yellowAccent,),)),
          ],
        ),
      ),
    );
  }
}
