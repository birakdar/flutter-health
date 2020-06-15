import 'package:flutter/material.dart';
import 'package:health/widgets/moods.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:health/utils.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;
  void onTapped(int value){
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildTopStack(),
            SizedBox(height: 40.0,),
            Padding(padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _buildNotificationCard(),
                  _buildNextAppointmentTitle('Your Next Appointment'),
                  _buildNextAppointmentInfo(),
                  _buildNextAppointmentTitle('Specialist In Your Area'),
                  _buildAreaSpecialists(),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(LineAwesomeIcons.home,size: 25.0,), title: Text('1')),
          BottomNavigationBarItem(icon: Icon(LineAwesomeIcons.search,size: 25.0,), title: Text('1')),
          BottomNavigationBarItem(icon: Icon(LineAwesomeIcons.gratipay,size: 25.0,), title: Text('1')),
        ],
        onTap: onTapped,
      ),
    );
  }

  _buildTopStack(){
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      overflow: Overflow.visible,
      children: <Widget>[
        _buildBackgroundCover(),
        _buildGreetings(),
        _buildMoodsHolder()
      ],
    );
  }

  _buildBackgroundCover(){
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        gradient: purpleGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        )
      ),
    );
  }

  _buildGreetings(){
    return Positioned(
      left: 20.0, bottom: 80.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Hi Ahmad', style: TextStyle(fontSize: 36.0,fontWeight: FontWeight.w600, color: Colors.white),),
          SizedBox(height: 10.0,),
          Text('How are you feeling today ?', style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }

  _buildMoodsHolder(){
    return Positioned(
      bottom: -30,
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width - 40,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(28)),
          boxShadow: [BoxShadow(
            color: Colors.black12,
            spreadRadius: 5.5,
            blurRadius: 5.5
          )]
        ),
        child: MyMoods(),
      ),
    );
  }

  _buildNotificationCard(){
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: lightColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: ListTile(
        leading: Icon(
          LineAwesomeIcons.calendar_check_o,color: Colors.white,size: 32,
        ),
        title: Text('Your visit with Dr Muhammad' ,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w200,color: Colors.white),),
        trailing: OutlineButton(
          onPressed: (){},
          color: Colors.transparent,
          borderSide: BorderSide(color: Colors.white ,width: 0.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: Text('Review', style: TextStyle(fontSize: 12.0,color: Colors.white),),
        ),
      ),
    );
  }

  _buildNextAppointmentTitle(title){
    return Container(
      margin: EdgeInsets.only(top: 20.0,bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title, style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),),
          Text('See All', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: lightColor),),
        ],
      ),
    );
  }

  _buildNextAppointmentInfo(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 14.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18)
      ),
      child: Column(
        children: <Widget>[
         Row(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             CircleAvatar(
               backgroundColor: Colors.grey,
               backgroundImage: AssetImage('images/man.png'),
               radius: 36,
             ),
             SizedBox(width: 12,),
             RichText(
              text: TextSpan(
                text: 'Dr : Hadi Alsaed',style: TextStyle(height: 1.5,fontSize: 16,color: Colors.black),
                children: [
                  TextSpan(
                    text: '\nSunday May 5th at 8:00 pm',style: TextStyle(color: Colors.black45,fontSize: 15,fontWeight: FontWeight.w400)
                  ),
                  TextSpan(
                      text: '\nBalat mah. Fatih',style: TextStyle(color: Colors.black38,fontSize: 13,fontWeight: FontWeight.w400)
                  ),
                ]
              ),
             )
           ],
         ),
          SizedBox(height: 8.0,),
          Divider(color: Colors.grey[200],height: 3.0,thickness: 1,),
          SizedBox(height: 8.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _iconBuilder(LineAwesomeIcons.check_circle,'Check In'),
              _iconBuilder(LineAwesomeIcons.times_circle,'Cansel'),
              _iconBuilder(LineAwesomeIcons.calendar_times_o,'Calender'),
              _iconBuilder(LineAwesomeIcons.compass,'Direction'),
            ],
          )
        ],
      ),
    );
  }

  _iconBuilder(icon,title){
    return Column(
      children: <Widget>[
        Icon(icon,size: 28,color: Colors.black,),
        SizedBox(height: 8.0,),
        Text(title,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300,color: Colors.black),)
      ],
    );
  }

  _buildAreaSpecialists(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14,horizontal: 18),
      margin: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1.0,
          blurRadius: 6.0,
        )],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage('images/man.png'),
                radius: 36,
              ),
              SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(text: 'Heart\n', style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Colors.purple,height: 1.3),
                    children: <TextSpan> [
                      TextSpan(text: 'Dr Nader Saken\n', style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.black)),
                      TextSpan(text: 'Poplar Pharma Limited\n', style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.black45)),
                      TextSpan(text: 'Syria Damascus Addres Area\n', style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Colors.black45)),
                    ]
                    ),
                  ),
                  SizedBox(height: 6.0,),
                  RaisedButton(
                    onPressed: (){},
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(88.0)),
                    padding: EdgeInsets.all(1.0),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: purpleGradient,borderRadius: BorderRadius.all(Radius.circular(88.0)),
                      ),
                      child: Container(
                        constraints: BoxConstraints(minHeight: 36,maxWidth: 88),
                        alignment: Alignment.center,
                        child: Text('Visit', style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.white),),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          Icon(LineAwesomeIcons.heart,color: lightColor,size: 36,)
        ],
      ),
    );
  }





}





