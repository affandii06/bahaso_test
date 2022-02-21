import 'package:bahaso_test/support_widget.dart';
import 'package:bahaso_test/view/posts.dart';
import 'package:bahaso_test/view/user.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              setColor: Colors.blue,
              setHeight: 40,
              setWidth: 250,
              setText: 'List Post',
              action: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PostsScreen()));
              },
            ),
            const SizedBox(height: 10,),
            CustomButton(
              setColor: Colors.blue,
              setHeight: 40,
              setWidth: 250,
              setText: 'User',
              action: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const UserScreen()));
              },
            ),
          ],
        ),
      )
    );
  }
}