import 'package:flutter/material.dart';
import 'package:habit_up/profile.dart';
import 'package:habit_up/todoui.dart';
import 'package:carousel_slider/carousel_slider.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
 
 List<String> imageList =[
"https://i.pinimg.com/736x/0a/4f/cc/0a4fcccef06661774e7f48225bba0fdb.jpg",
"https://www.developgoodhabits.com/wp-content/uploads/2019/12/habit-quotes-success-683x1024.jpg",
"https://cdn.quotesgram.com/img/0/37/807928091-283600-Inspirational_quotes___habits_.jpg",
"https://i.pinimg.com/736x/6a/a1/c2/6aa1c223477ec9241d275136be14c07a.jpg"

 ];


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //  appBar: new AppBar(
      //    title: new Text("Home"),

      //  ),
       body : SingleChildScrollView(
        
         child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.0,),
              Center(
                // child: CircleAvatar(
                //   backgroundImage: AssetImage('assets/bitmoji.jpg'),
                //   radius: 100.0,
                // ),
                
                 child: Container(
                      
                      height:200,
                      child: Image(image: AssetImage("assets/bitmoji.jpg"),
                      fit: BoxFit.contain
                      ),
                     ),
              ),
               SizedBox(height: 20.0,),
              Row(
                children: [
                   SizedBox(width: 90.0),
       
                  Center(
                    
                    child: Container(
                      
                      height:50,
                      child: Image(image: AssetImage("assets/streak.png"),
                      fit: BoxFit.contain
                      ),
                     ),
                  ),
       
                  
              
                  Text(
                    '56',
                    style: TextStyle( color: Colors.black,
                      fontSize: 40.0,
                      letterSpacing: 1.0,
       
                    ),
                  ),
            ]
         ),
          SizedBox(height: 20),
          Center(
            child: Text(
                      'Daily Streak',
                      style: TextStyle( color: Colors.grey[400],
                        fontSize: 30.0,
                        letterSpacing: 1.0,
       
                      ),
                    ),
          ),
           Divider(
              height: 90.0,
                color:Colors.grey[800]
            ),

            Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   RaisedButton(
                     onPressed: (){
                         Navigator.push(context,
                       MaterialPageRoute(builder: (context)=>TodoUi()));
                     },
                     padding: EdgeInsets.all(0.0),
                   shape: RoundedRectangleBorder(borderRadius:
                    BorderRadius.circular(30.0)),
                    elevation: 30.0,
                    child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                         Color(0xFFFF9800),
                         Color(0xFFE65100)
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight
                      ),
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth:150,
                        maxHeight:50,
                      ),
                      alignment: Alignment.center,
                      child: Text('Your Habits',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                            fontWeight: FontWeight.bold,
         
                      ))),
                    ),
                    
                   ),
                    SizedBox(width: 10.0,),
                     RaisedButton(
                     onPressed: (){
                          Navigator.push(context,
                       MaterialPageRoute(builder: (context)=>profile()));
                     },
                     padding: EdgeInsets.all(0.0),
                   shape: RoundedRectangleBorder(borderRadius:
                    BorderRadius.circular(30.0)),
                    elevation: 30.0,
                    child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                         Color(0xFFFF9800),
                         Color(0xFFE65100)
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight
                      ),
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth:150,
                        maxHeight:50,
                      ),
                      alignment: Alignment.center,
                      child: Text('Your Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                            fontWeight: FontWeight.bold,
         
                      ))),
                    ),
                    
                   ),
                  ],
                ),
                Divider(
              height: 90.0,
                color:Colors.grey[800]
            ),
          CarouselSlider(items: imageList.map((e) => ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(e, 
                height: 500,
                width: 300,
                fit: BoxFit.cover,
                ),
                // Text(e)
              ],
            )
          )).toList(),
           options: CarouselOptions(
             autoPlay:  true,
             enableInfiniteScroll: false,
             enlargeCenterPage: true,
             height: 450
           ),),
         SizedBox(height: 40),
            ]
            
            ),
            
         ),
       ) 
       
    );
  }
}