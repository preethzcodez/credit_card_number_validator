# credit_card_number_validator

A dart package to check if card number is valid and also returns card type as well.

# Installing
1. Add dependency to `pubspec.yaml`

    *Get the current version in the 'Installing' tab on https://pub.dev/packages/credit_card_number_validator/Installing*
```
dependencies:
    credit_card_number_validator: *current-version*
```

2. Import the package
```
import 'package:credit_card_number_validator/credit_card_number_validator.dart';
```

#  Usage
A basic example

    Map<String, dynamic> cardData = CreditCardValidator.getCard(cardNumberString);
    String cardType = cardData[CreditCardValidator.cardType];
    bool isValid = cardData[CreditCardValidator.isValidCard];

```
# Features
* Supported cards:
  * Visa
  * Mastercard
  * American Express
  * Discover
  * Diners Club
  * JCB


# Author
Preeth Prathapan - *Creator and repo owner* - [Github Profile](https://github.com/preethzcodez)

# License
This project is licensed under the MIT License - see the [LICENSE file](LICENSE) for more details
