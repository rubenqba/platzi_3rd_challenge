import 'package:flutter/material.dart';

class SimpleAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return _appbar();
  }

  Widget _title() {
    return Container(
      margin: EdgeInsets.only(
        top: 40.0,
        left: 100.0,
      ),
      child: Text(
        "DESIGNERS",
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _menu() {
    return Container(
      margin: EdgeInsets.only(
        top: 40.0,
        left: 20.0,
      ),

      child: Icon(
        Icons.menu,
        color: Colors.white,
      ),
    );
  }

  Widget _appbar() {
    return Container(
      height: 120.0,
      alignment: Alignment(-0.9, -0.6),

      decoration: BoxDecoration(
          color: Colors.blueAccent,
          image: DecorationImage(
            image: AssetImage("assets/img/office.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.blueAccent.withOpacity(0.3), BlendMode.dstATop),
          )
      ),
      child: Row(
        children: <Widget>[
          _menu(),
          _title(),
        ],
      ),
    );
  }
}
