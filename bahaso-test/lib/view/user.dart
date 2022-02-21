import 'package:bahaso_test/support_widget.dart';
import 'package:bahaso_test/user/user_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({ Key? key }) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  TextEditingController cName = TextEditingController();
  TextEditingController cAge = TextEditingController();

  setUser()async{
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      cName.text = prefs.getString('name') ?? '';
      cAge.text = prefs.getString('age') ?? '';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomFormField(
              setController: cName,
              setHint: 'Nama',
              setBorder: true,
            ),
            const SizedBox(height: 10,),
            CustomFormField(
              setController: cAge,
              setHint: 'Umur',
              setBorder: true,
              setInputType: TextInputType.number,
            ),
            const SizedBox(height: 20,),
            CustomButton(
              setColor: Colors.blue,
              setHeight: 50,
              setWidth: double.infinity,
              setText: 'Save',
              action: (){
                UserService.saveAccount(cName.text, cAge.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}