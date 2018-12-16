import 'package:flutter/material.dart';

class ShipCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ExpansionTile(
        title: Text(
          "Calcular frete",
          textAlign: TextAlign.start,
          style: TextStyle(fontWeight: FontWeight.w300, color: Colors.green),
        ),
        leading: Icon(Icons.location_on),
        trailing: Icon(Icons.add),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Não está funcionando"),
              initialValue: "",
              onFieldSubmitted: (text) {

              },
            ),
          )
        ],
      ),
    );
  }
}
