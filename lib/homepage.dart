import 'package:flutter/material.dart';
import 'package:trippy_tales/cards.dart';
import 'package:trippy_tales/contactUs.dart';
import 'package:trippy_tales/destination_carousel.dart';
import 'package:trippy_tales/help.dart';
import 'package:trippy_tales/hotel_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trippy_tales/privacy.dart';
import 'package:trippy_tales/t&c.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'addSchedule.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title, this.uid}) : super(key: key); //update this to include the uid in the constructor
  final String title;
  final String uid; //include this

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseUser currentUser;
  initState() {
    this.getCurrentUser();
    super.initState();
  }
  void getCurrentUser() async {
    currentUser = await FirebaseAuth.instance.currentUser();
  }

  String currentProfilePic = "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSNvsoYqe-vwK1oF2vQwxcTwJumMKto3yIzaFBPaw_RAeD5fIVM&usqp=CAU";
  String otherProfilePic = "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSo-phwTLVh9T1bnqDk4StMo1f_zHVw6NybgPYtg-ARaWsQFyXK&usqp=CAU";

  void switchAccounts() {
    String picBackup = currentProfilePic;
    this.setState(() {
      currentProfilePic = otherProfilePic;
      otherProfilePic = picBackup;
    });
  }
  int _selectedIndex = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.city,
    FontAwesomeIcons.fillDrip,
    FontAwesomeIcons.store,
    FontAwesomeIcons.umbrellaBeach,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 45.0,
        width: 45.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 20.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFFFA000),
        ),
      ),
    );
  }
  void showContent() {
    showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Log out'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text('Are you sure you want to log out?'),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text('Log out'),
              onPressed: () {
        FirebaseAuth.instance
            .signOut()
            .then((result) =>
        Navigator.pushReplacementNamed(context, "/login"))
            .catchError((err) => print(err));
         },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountEmail: new Text("paljeets.sambhi11@gmail.com"),
              accountName: new Text("Paljeet Singh Sambhi"),
              currentAccountPicture: new GestureDetector(
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(currentProfilePic),
                ),
                onTap: () => print("This is your current account."),
              ),
              otherAccountsPictures: <Widget>[
                new GestureDetector(
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage(otherProfilePic),
                  ),
                  onTap: () => switchAccounts(),
                ),
              ],
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQmSGKL0FQlm4PbWwRvrCOZH3Uaqmqe1l1VOFlsDbTZqRobtTIm&usqp=CAU"),
                      fit: BoxFit.fill
                  )
              ),
            ),

            new ListTile(
              title: new Text("Notifications"),
              trailing: new Icon(Icons.notifications),
              onTap: () => Navigator.pop(context),
            ),
            new ListTile(
                title: new Text("Privacy & Data"),
                trailing: new Icon(Icons.lock),
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new privacyData()))
            ),
            new Divider(),

            new ListTile(
                title: new Text("Contact Us"),
                trailing: new Icon(Icons.info_outline),
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new contactUs()))
            ),
            new ListTile(
              title: new Text("Terms & Conditions"),
              trailing: new Icon(Icons.copyright),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new termsAnd())),
            ),
            new ListTile(
              title: new Text("Help"),
              trailing: new Icon(Icons.help_outline),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Help())),
            ),
            new Divider(),

            new ListTile(
                title: new Text("Log out"),
                trailing: new Icon(Icons.power_settings_new),
                onTap: () => showContent()
            ),
            new ListTile(
              title: new Text("Cancel"),
              trailing: new Icon(Icons.cancel),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan[600],
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => AddPlaces()));
        },

        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 10.0,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()));

              },),
            IconButton(icon: Icon(Icons.filter_frames),
              onPressed: () {
              },),
            IconButton(icon: Icon(Icons.place),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => CardsPage()));

              },
            ),
            IconButton(icon: Icon(Icons.person),
              onPressed: () {
              },
            ),
          ],
        ),
      ),
      body:new CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: true,
            pinned: true,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)
                )
            ),
            flexibleSpace: new FlexibleSpaceBar(
              title: new Text("Trippy Tales"),
              background: Image.network(
                "https://ect.co.in/wp-content/uploads/2017/04/Careers-in-Travel-and-Tourism.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
            child: SafeArea(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 120.0),
                    child: Text(
                      'What would you like to do?',
                      style: TextStyle(
                        fontSize: 16.7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _icons
                        .asMap()
                        .entries
                        .map(
                          (MapEntry map) => _buildIcon(map.key),
                    )
                        .toList(),
                  ),
                  SizedBox(height: 20.0),
                  DestinationCarousel(),
                  SizedBox(height: 20.0),
                  HotelCarousel(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}