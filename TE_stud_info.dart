import 'package:flutter/material.dart';

class TEClassInfo extends StatefulWidget {
  @override
  _TEClassInfoState createState() => _TEClassInfoState();
}

class _TEClassInfoState extends State<TEClassInfo> {
  List<Map<String, dynamic>> _products = [
    {'title': 'Khursheed', 'surname': 'Gaddi', 'roll': '11'},
    {'title': 'Sunny', 'surname': 'Gupta', 'roll': '15'},
    {'title': 'Sudheer', 'surname': 'Gupta', 'roll': '54'},
    {'title': 'Ashutosh', 'surname': 'Mishra', 'roll': '44'},
    {'title': 'Sachin', 'surname': 'Singh', 'roll': '59'},
    // {'title': 'Nooman', 'surname': 'Khan', 'roll': '22'},
    // {'title': 'Ashif', 'surname': 'Nadkar', 'roll': '25'},
    // {'title': 'Sapna', 'surname': 'Chaudhary', 'roll': '53'},
    // {'title': 'Danish', 'surname': 'Ansari', 'roll': '21'},
    // {'title': 'Umair', 'surname': 'Khan', 'roll': '69'},
    // {'title': 'Yaseen', 'surname': 'Chaudhary', 'roll': '33'},
  ];

  List<int> clickedBtn = [];
  int index;
  Widget _buildCard(index) {
    return Column(
      children: [
        Container(
          height: 500,
          child: ListView.builder(
              itemCount: _products.length,
              itemBuilder: (BuildContext context, index) {
                return Card(
                  elevation: 5,
                  child: Column(
                    children: <Widget>[
                      Divider(),
                      ListTile(
                        onTap: () {
                          cardDialogBox(index);
                        },
                        leading: CircleAvatar(
                          child: Text(_products[index]['roll']),
                        ),
                        title: Text(
                          _products[index]['title'] +
                              " " +
                              _products[index]['surname'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            FlatButton(
                              color: clickedBtn[index] == 1
                                  ? Colors.green
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.zero,
                                      bottomRight: Radius.zero,
                                      topLeft: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(5.0))),
                              onPressed: () {
                                setState(() {
                                  print(
                                      "${_products[index]['title']}: Present");
                                  clickedBtn[index] = 1;
                                });
                              },
                              child: Text(
                                "Present",
                                style: TextStyle(
                                  color: clickedBtn[index] == 1
                                      ? Colors.white
                                      : null,
                                ),
                              ),
                            ),
                            FlatButton(
                              color: clickedBtn[index] == 2
                                  ? Colors.orange
                                  : Colors.white,
                              child: Text(
                                "Absent",
                                style: TextStyle(
                                  color: clickedBtn[index] == 2
                                      ? Colors.white
                                      : null,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0)),
                              onPressed: () {
                                setState(() {
                                  print("${_products[index]['title']}: Absent");
                                  clickedBtn[index] = 2;
                                });
                              },
                            ),
                            FlatButton(
                              color: clickedBtn[index] == 3
                                  ? Colors.amber
                                  : Colors.white,
                              child: Text(
                                "Late",
                                style: TextStyle(
                                  color: clickedBtn[index] == 3
                                      ? Colors.white
                                      : null,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.zero,
                                      bottomLeft: Radius.zero,
                                      topRight: Radius.circular(5.0),
                                      bottomRight: Radius.circular(5.0))),
                              onPressed: () {
                                setState(() {
                                  print("${_products[index]['title']}: Late");
                                  clickedBtn[index] = 3;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
        Center(
          child: RaisedButton(
            onPressed: () {},
            child: Text("Submit"),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i <= _products.length; i++) {
      clickedBtn.add(0);
    }
    return Scaffold(
      body: Center(
        child: _buildCard(index),
      ),
    );
  }

  // All the Methods will be defined here.

  cardDialogBox(index) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
              child: AlertDialog(
            title: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber,
                  ),
                  child: SizedBox(
                      height: 60,
                      width: 60,
                      child: Center(child: Text(_products[index]['roll']))),
                ),
                Text(_products[index]['title']),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                    "Information about the List Tile. Information about the List Tile"),
                Text("Attendance Status ${clickedBtn[index]}"),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK")),
            ],
          ));
        });
  }
}
