import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        primaryColor: Colors.orange, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    title: "Simple Interest Calculator",
    home: Scaffold(
        //resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          elevation:20,
          centerTitle: true,
          backgroundColor: Colors.orange,
          title: Text("Simple Interest Calculator"),
        ),
        body: gui()),
  ));
}

class gui extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ui();
  }
}

class ui extends State<gui> {
  var formKey = GlobalKey<FormState>();
  double p = 0, r = 0, t = 0, si, a;
  String str = "";
  var ptc = TextEditingController();
  var rtc = TextEditingController();
  var ttc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Scrollbar(
          child: ListView(
            children: <Widget>[
              Img(),
              Padding(
                child: TextFormField(
                  validator: (String val) {
                    if (val.isEmpty) return ("*Enter Prinicipal amount first !");
                  },
                  controller: ptc,
                  textAlign: TextAlign.right,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.arrow_forward_ios),
                    fillColor: Colors.yellowAccent,
                    labelText: "Principal",
                    hintText: "Enter Principal value",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  enableInteractiveSelection: true,
                  onFieldSubmitted: (var userp) {
                    setState(() {
                      p = userp as double;
                    });
                  },
                ),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              ),
              Padding(
                child: TextFormField(
                  validator: (String val) {
                    if (val.isEmpty) return ("*Enter Interest Rate first !");
                  },
                  controller: rtc,
                  textAlign: TextAlign.right,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.equalizer),
                    fillColor: Colors.yellowAccent,
                    labelText: "Rate of Interest (%)",
                    hintText: "Enter Rate of Interest per annum",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  enableInteractiveSelection: true,
                  onFieldSubmitted: (var userr) {
                    setState(() {
                      r = userr as double;
                    });
                  },
                ),
                padding: EdgeInsets.all(10),
              ),
              Padding(
                child: TextFormField(
                  validator: (String val) {
                    if (val.isEmpty) return ("*Enter term first !");
                  },
                  controller: ttc,
                  textAlign: TextAlign.right,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.event),
                    fillColor: Colors.yellowAccent,
                    labelText: "Term",
                    hintText: "Enter Time in year(s)",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  enableInteractiveSelection: true,
                  onFieldSubmitted: (var usert) {
                    setState(() {
                      t = usert as double;
                    });
                  },
                ),
                padding: EdgeInsets.all(10),
              ),
              Center(
                  child: Container(
                      child: Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(65, 10, 10, 10),
                      child: Expanded(
                        child: RaisedButton(
                          color: Colors.orangeAccent,
                          textColor: Colors.white,
                          elevation: 10,
                          child: Text(
                            "Calculate",
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () {
                            setState(() {
                              if (formKey.currentState.validate())
                                this.str = calc();
                            });
                          },
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Expanded(
                      child: RaisedButton(
//  color: Colors.white,
                        textColor: Colors.orange,
                        elevation: 10,
                        child: Text(
                          "Reset",
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () {
                          setState(() {
                            reset();
                          });
                        },
                      ),
                    ),
                  )
                ],
              ))),
              Padding(
                  padding: EdgeInsets.fromLTRB(20,5,15,10),
                  child: Center(
                    child: Text(
                      this.str,
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent),
                    ),
                  ))
            ],
          ),
        ));
  }

  String calc() {
    double pz = double.parse(ptc.text);
    double rz = double.parse(rtc.text);
    double tz = double.parse(ttc.text);

    double siz = (pz * rz * tz) / 100;
    double az = pz + siz;
    String sstr = "*SIMPLE INTEREST = ₹$siz  and *Total AMOUNT after $tz year(s) = ₹$az";

    return sstr;
  }

  void reset() {
    ptc.text = "";
    rtc.text = "";
    ttc.text = "";
    str = "";
  }
}

class Img extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return img();
  }

  Widget img() {
    var assetImage = AssetImage("images/mag.png");
    var image = Image(
      image: assetImage,
      width: 150,
      height: 150,
    );
    return Container(
      child: image,
      alignment: Alignment.center,
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.all(15.0),
    );
  }
}
