import 'package:flutter/material.dart';
import 'package:platzi_3rd_challenge/components/designer_item.dart';
import 'package:platzi_3rd_challenge/components/simple_app_bar.dart';
import 'package:platzi_3rd_challenge/components/enhanced_app_bar.dart';
import 'package:platzi_3rd_challenge/model/designer.dart';
import 'package:platzi_3rd_challenge/model/model_util.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "SourceSansPro"
      ),
      home: Scaffold(
        body: designersView(),
      ),
    );
  }

  Widget designersView() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 55
          ),
          child: designersList(),
        ),
        EnhancedAppBar()
      ],
    );
  }

  Widget designersList() {
    return FutureBuilder(
      future: ModelUtil.fetchDesigners(10),
      builder: listView,
    );
  }

  Widget listView(BuildContext context, AsyncSnapshot<List<DesignerModel>> snapshot) {
    if (snapshot.hasError) {
      return Text(
        "There was an error 😥",
        style: Theme.of(context).textTheme.headline5,
      );
    } else if (snapshot.hasData) {
      List<DesignerItem> items = snapshot.data!.map((d) => DesignerItem(d)).toList();
      return ListView(
        children: items,
      );
    }
    return CircularProgressIndicator();
  }
}
