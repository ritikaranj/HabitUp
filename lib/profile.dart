import 'package:flutter/material.dart';


class profile extends StatefulWidget {
  profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
     return new Scaffold(
       appBar: new AppBar(
         title: new Text("profile"),
       ),
       body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/profile.png'),
                radius: 40.0,
              ),
            ),
            // Divider(
            //     height: 140.0,
            //     color:Colors.grey[800]
            // ),
            Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,

              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Ritika Ranjan',
              style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold

              ),
            ),
            SizedBox(height: 20.0,),
            Row(
              children: [
                 Icon(
                  Icons.stars_rounded,
                  color: Colors.yellow,

                ),

                
                SizedBox(width: 10.0),
                Text(
                  '47 Coins',
                  style: TextStyle( color: Colors.grey[400],
                    fontSize: 18.0,
                    letterSpacing: 1.0,

                  ),
                ),
              ]),
          
            SizedBox(height: 30.0,),
            Row(
              children: [
                Icon(
                  Icons.mail,
                  color: Colors.grey,

                ),
                SizedBox(width: 10.0),
                Text(
                  'ritikaranjanpatna@gmail.com',
                  style: TextStyle( color: Colors.grey[400],
                    fontSize: 18.0,
                    letterSpacing: 1.0,

                  ),
                ),
                ],

            )

          ],
        ),

      ),
    );
  }
}