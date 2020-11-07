import 'dart:convert';
import 'package:janathanursery/screen/productList/customappbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:janathanursery/data/data.dart';
import 'package:janathanursery/screen/profile/profile.dart';
import 'package:janathanursery/theme/theme.dart';
import 'package:http/http.dart' as http;
import 'customfetchserver.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList>
    with TickerProviderStateMixin {
  TabController tabController;
  //GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey(); -> another example
  final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>(); // scaffold key for drawer

  List _categoty = []; // created for temperoily

  List<Data> janathaData = janatha(); // empty data . data from github json

  // fetching server from github
  Future<void> fetchFromServer(String url) async {
    //checking list is empty or not

    final fetchData = await http.get(url);
    //print(fetchData.body);
    final decodeData =
        json.decode(fetchData.body); // decode json file from github
    print(decodeData);

    for (var item in decodeData) {
      //  decodeData -> item
      janathaData.add(
        Data(
          id: item['id'],
          category: item['category'],
          name: item['name'],
          price: item['price'],
          imgpath: item['imgpath'],
          info: item['info'],
        ),
      );
    }

    print(janathaData.length);
    for (var item in janathaData) {
      // removing repeated content from janathaData to category
      if (_categoty
          .where((element) => element == item.category)
          .toList()
          .isNotEmpty) {
        continue;
      }
      _categoty.add(item.category);
    }
  }

  onPressedEvent(BuildContext context) {
    Navigator.of(context).pushNamed(Profile.routProfile);
  }

  @override
  Widget build(BuildContext context) {
    if (janathaData.isNotEmpty)
      janathaData.clear();
    else
      debugPrint('janathaData is Empty1');

    tabController = TabController(length: 5, vsync: this);

    var tabBarItem = TabBar(
      tabs: [
        Tab(
          child: Text(
            'Indoor',
            style: TextStyle(
                fontSize: 17.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            'Outdoor',
            style: TextStyle(
                fontSize: 17.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            'Plant',
            style: TextStyle(
                fontSize: 17.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            'Seeds',
            style: TextStyle(
                fontSize: 17.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            'Pots',
            style: TextStyle(
                fontSize: 17.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
      controller: tabController,
      indicatorColor: Colors.transparent,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey.withOpacity(0.5),
      isScrollable: true,
    );

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            //controller: _hideButtonController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomAppBar(
                  onpressface: () => onPressedEvent(context),
                  //another example -> Scaffold.of(context).openDrawer(); in this case not need global variable
                  onpressdrawer: () => _scaffoldKey.currentState.openDrawer(),
                ),
                textfield(),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: tabBarItem,
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 200.0,
                  child: TabBarView(
                    controller: tabController,
                    children: <Widget>[
                      CustomFetchServer(urrll: Data.jsonindoor),
                      CustomFetchServer(urrll: Data.jsonoutdoor),
                      CustomFetchServer(urrll: Data.jsonindoor),
                      CustomFetchServer(urrll: Data.jsonoutdoor),
                      CustomFetchServer(urrll: Data.jsonindoor)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      key: _scaffoldKey, // assign key to Scaffold
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              color: Colors.grey,
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Text('Janatha Nursery'),
                  Text('Phone : 9745369474,04885223603'),
                  Text('Guruvayoor road, Kunnamkulam')
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.picture_in_picture),
              title: Text('Gallery'),
              onTap: () {
                // enter something
              },
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('Location'),
              onTap: () {
                // enter something
              },
            ),
            ListTile(
              leading: Icon(Icons.hourglass_empty),
              title: Text('Privacy Policy'),
              onTap: () {
                //enter something
              },
            ),
            ListTile(
              leading: Icon(Icons.hourglass_empty),
              title: Text('Terms and condition'),
              onTap: () {
                //enter something
              },
            )
          ],
        ),
      ),
    );
  }

  Padding textfield() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 4, right: 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: color_grey.withOpacity(0.50), blurRadius: 5)
          ],
        ),
        child: TextField(
          autofocus: false,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: color_grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 0, style: BorderStyle.none),
            ),
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 15, left: 8),
              child: IconButton(
                icon: Icon(Icons.search, size: 24, color: color_grey),
                onPressed: () => null,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding line() {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
        height: 0.4,
        color: color_grey.withOpacity(0.5),
      ),
    );
  }

  Padding text(text) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text(text),
    );
  }
}
