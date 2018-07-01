import 'package:flutter/material.dart';
class HomePage extends StatefulWidget
{
  final  List coins;
  HomePage(this.coins);
  @override
  _HomePageState createState()=> new _HomePageState();
}
class _HomePageState extends State<HomePage>
{ List coins;
  final List<MaterialColor>_colors = [Colors.teal,Colors.purple,Colors.red];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text("Crypto Coin Watch"),),
      body: _cryWidget()



    );
  }
  Widget _cryWidget() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              itemCount: widget.coins.length,itemBuilder:(
                BuildContext context, int index) {
              final Map currency = widget.coins[index];
              final MaterialColor color = _colors[index % _colors.length];
              return _getUI(currency,color);
            },
            )
        ),
        ],
      )
    );
    }
    ListTile _getUI(Map currency,MaterialColor color){
    return new ListTile(
      leading: new CircleAvatar(backgroundColor: color,
      child: new Text(currency['name'][0]),
      ),
      title: new Text(currency['name'],
        style: new TextStyle(fontWeight: FontWeight.bold)),
      subtitle: _getSubtitleText(currency['price_usd'], currency['percent_change_1h']),
      isThreeLine: true,
    );
    }
    Widget _getSubtitleText(String priceUSD, String percentageChange) {
      TextSpan priceTextWidget = new TextSpan(text: "\$$priceUSD\n",
          style: new TextStyle(color: Colors.black));
      String percentageChangeText = "1 hour: $percentageChange%";
      TextSpan percentageChangeTextWidget;
      if (double.parse(percentageChange) > 0) {
        percentageChangeTextWidget = new TextSpan(text: percentageChangeText,
            style: new TextStyle(color: Colors.green));
      }
      else {
        percentageChangeTextWidget = new TextSpan(text: percentageChangeText,
            style: new TextStyle(color: Colors.red));
      }
      return new RichText(
          text: new TextSpan(
              children: [priceTextWidget, percentageChangeTextWidget]));
    }

    }
