import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/rc_logo.png'),
            SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            SizedBox(
              width: 0.8 * MediaQuery.of(context).size.width,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Email Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: 0.8 * MediaQuery.of(context).size.width,
              child: TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 60,
              width: 0.8 * MediaQuery.of(context).size.width,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                onPressed: () {},
                child: Text(
                  'ADD TASK',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: Text(
                    'Password',
                    style: TextStyle(
                      color: Color.fromRGBO(225, 0, 31, 1),
                      fontSize: 14.0,
                      fontFamily: 'Karla',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Text(
                  '   |   ',
                  style: TextStyle(
                    color: Color.fromRGBO(225, 0, 31, 1),
                    fontSize: 14.0,
                    fontFamily: 'Karla',
                    fontWeight: FontWeight.w300,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Color.fromRGBO(225, 0, 31, 1),
                      fontSize: 14.0,
                      fontFamily: 'Karla',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60.0,
            ),
            RichText(
              text: TextSpan(
                  text: 'By signing up, you agree with our ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontFamily: 'Karla',
                    fontWeight: FontWeight.normal,
                  ),
                  children: [
                    TextSpan(
                      text: 'Terms & Conditions',
                      style: TextStyle(
                        color: Color.fromRGBO(225, 0, 31, 1),
                        fontSize: 14.0,
                        fontFamily: 'Karla',
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
