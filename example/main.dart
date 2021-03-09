import 'package:credit_card_number_validator/credit_card_number_validator.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  /// Card Number Controller
  TextEditingController _cardNumberController = TextEditingController();

  // Declare Variables To Store Card Type and Validity
  String? cardType;
  bool? isValid = false;

  // Initial State
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Set A Sample Card Value - VISA Card
    _cardNumberController.text = "4111111111111111";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Credit Card Validator Demo'),
      ),
      body: Center(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ENTER CARD NUMBER',
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _cardNumberController,
                  decoration: InputDecoration(
                      hintText: 'Card Number',
                      hintStyle: TextStyle(color: Color(0xFFCCCCCC)),
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 14.0, horizontal: 7.0),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      border: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                      ))),
            ),
            Container(
              height: 55,
              child: RaisedButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Text('Get Card Data',
                    style: TextStyle(color: Colors.white, fontSize: 18.0)),
                onPressed: () {
                  // Get Card Type and Validity Data As Map - @param Card Number
                  Map<String, dynamic> cardData =
                      CreditCardValidator.getCard(_cardNumberController.text);
                  setState(() {
                    // Set Card Type and Validity
                    cardType = cardData[CreditCardValidator.cardType];
                    isValid = cardData[CreditCardValidator.isValidCard];
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: cardType != null
                  // Display Card Type and Validity
                  ? Text('Card Type : $cardType \nCard Number Valid: $isValid',
                      style: TextStyle(
                          color: isValid! ? Colors.green : Colors.red,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w800))
                  : Text(' \n '),
            )
          ],
        )),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}
