import 'package:flutter_test/flutter_test.dart';

import 'package:credit_card_validator/credit_card_validator.dart';

void main() {
  test("Expect a VISA card", () {
    Map<String, dynamic> cardData =
        CreditCardValidator.getCard("4111111111111111");
    expect(cardData[CreditCardValidator.cardType], "VISA");
    expect(cardData[CreditCardValidator.isValidCard], true);
  });
}
