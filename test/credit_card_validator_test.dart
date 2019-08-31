import 'package:credit_card_number_validator/credit_card_number_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Expect a VISA card", () {
    Map<String, dynamic> cardData =
        CreditCardValidator.getCard("4111111111111111");
    expect(cardData[CreditCardValidator.cardType], "VISA");
    expect(cardData[CreditCardValidator.isValidCard], true);
  });

  test("Expect a VISA card", () {
    Map<String, dynamic> cardData =
        CreditCardValidator.getCard("4012888888881881");
    expect(cardData[CreditCardValidator.cardType], "VISA");
    expect(cardData[CreditCardValidator.isValidCard], true);
  });

  test("Expect a AMEX Express card", () {
    Map<String, dynamic> cardData =
        CreditCardValidator.getCard("378282246310005");
    expect(cardData[CreditCardValidator.cardType], "AMEX");
    expect(cardData[CreditCardValidator.isValidCard], true);
  });

  test("Expect a AMEX Express card", () {
    Map<String, dynamic> cardData =
        CreditCardValidator.getCard("371449635398431");
    expect(cardData[CreditCardValidator.cardType], "AMEX");
    expect(cardData[CreditCardValidator.isValidCard], true);
  });

  test("Expect a AURA Express card", () {
    Map<String, dynamic> cardData =
        CreditCardValidator.getCard("5078601870000127985");
    expect(cardData[CreditCardValidator.cardType], "AURA");
    expect(cardData[CreditCardValidator.isValidCard], true);
  });
  test("Expect a AURA Express card", () {
    Map<String, dynamic> cardData =
        CreditCardValidator.getCard("5078601800003247449");
    expect(cardData[CreditCardValidator.cardType], "AURA");
    expect(cardData[CreditCardValidator.isValidCard], true);
  });

  test("Expect a DINERS Express card", () {
    Map<String, dynamic> cardData =
        CreditCardValidator.getCard("30569309025904");
    expect(cardData[CreditCardValidator.cardType], "DINERS");
    expect(cardData[CreditCardValidator.isValidCard], true);
  });

   test("Expect a DINERS Express card", () {
    Map<String, dynamic> cardData =
        CreditCardValidator.getCard("38520000023237");
    expect(cardData[CreditCardValidator.cardType], "DINERS");
    expect(cardData[CreditCardValidator.isValidCard], true);
  });

  test("Expect a DISCOVER Express card", () {
    Map<String, dynamic> cardData =
        CreditCardValidator.getCard("6011111111111117");
    expect(cardData[CreditCardValidator.cardType], "DISCOVER");
    expect(cardData[CreditCardValidator.isValidCard], true);
  });

  test("Expect a ELO Express card", () {
    Map<String, dynamic> cardData =
        CreditCardValidator.getCard("6362970000457013");
    expect(cardData[CreditCardValidator.cardType], "ELO");
    expect(cardData[CreditCardValidator.isValidCard], true);
  });

  test("Expect a HIPERCARD Express card", () {
    Map<String, dynamic> cardData =
        CreditCardValidator.getCard("6062825624254001");
    expect(cardData[CreditCardValidator.cardType], "HIPERCARD");
    expect(cardData[CreditCardValidator.isValidCard], true);
  });

  test("Expect a MASTERCARD Express card", () {
    Map<String, dynamic> cardData =
        CreditCardValidator.getCard("5555555555554444");
    expect(cardData[CreditCardValidator.cardType], "MASTERCARD");
    expect(cardData[CreditCardValidator.isValidCard], true);
  });

  test("Expect a MASTERCARD Express card", () {
    Map<String, dynamic> cardData =
        CreditCardValidator.getCard("5105105105105100");
    expect(cardData[CreditCardValidator.cardType], "MASTERCARD");
    expect(cardData[CreditCardValidator.isValidCard], true);
  });
}
