import 'package:flutter/material.dart';
import 'package:platzi_3rd_challenge/model/designer.dart';

class DesignerItem extends StatelessWidget {
  final DesignerModel _item;

  DesignerItem(this._item);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _avatar(),
        Expanded(child: _details(context)),
        _contact()
      ],
    );
  }

  Widget _avatar() {
    return Container(
      margin: EdgeInsets.only(
          top: 20,
          left: 20
      ),
      width: 80,
      height: 80,

      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(_item.avatar)
          )
      ),
    );
  }

  Widget _name(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 5,
        left: 15
      ),
      child: Text(
        _item.name,
        style: Theme.of(context).textTheme.headline6!.copyWith(
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget _detail(BuildContext context) {
    String value = "no experience";
    if (_item.experience == 1) {
      value = "1 year";
    } else if (_item.experience > 1) {
      value = "${_item.experience} years";
    }

    return Container(
      margin: EdgeInsets.only(
          top: 5,
          left: 15
      ),
      child: Text(
        "Experience: $value",
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  Widget _details(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _name(context),
        _detail(context)
      ],
    );
  }

  Widget _contact() {
    return Container(
      margin: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20
      ),
      width: 50,
      height: 50,

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _item.experience <= 3 ? Colors.black54 : Colors.red
      ),
      child: Icon(
        Icons.email_rounded,
        color: Colors.white,
      ),
    );
  }
}
