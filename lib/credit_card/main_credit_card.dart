import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_examples/credit_card/credit_card_provider.dart';
import 'package:flutter_examples/widgets/my_app_bar.dart';
import 'package:provider/provider.dart';

class MainCreditCard extends StatelessWidget {
  const MainCreditCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CreditCardProvider()),
      ],
      child: Scaffold(
        appBar: myAppBar('Tarjeta de Crédito'),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            margin: const EdgeInsets.only(bottom: 30),
            child: Column(children: const [
              _CreateCreditCard(),
              _ShowCreditCardData(),
            ]),
          ),
        ),
      ),
    );
  }
}

class _CreateCreditCard extends StatefulWidget {
  const _CreateCreditCard({Key? key}) : super(key: key);

  @override
  __CreateCreditCardState createState() => __CreateCreditCardState();
}

class __CreateCreditCardState extends State<_CreateCreditCard> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String cardNumber = '';
    String expiryDate = '';
    String cardHolderName = '';
    String cvvCode = '';
    final creditCardProvider = Provider.of<CreditCardProvider>(context);

    OutlineInputBorder border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );

    return Column(
      children: [
        CreditCardWidget(
          glassmorphismConfig: null,
          cardNumber: creditCardProvider.getCardNumber,
          expiryDate: creditCardProvider.getExpiryDate,
          cardHolderName: creditCardProvider.getCardHolderName,
          cvvCode: creditCardProvider.getCvvCode,
          showBackView: creditCardProvider.getIsCvvFocused,
          obscureCardNumber: true,
          obscureCardCvv: true,
          isHolderNameVisible: true,
          cardBgColor: const Color.fromRGBO(0, 47, 50, 1),
          backgroundImage: null,
          isSwipeGestureEnabled: true,
          onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
          customCardTypeIcons: <CustomCardTypeIcon>[
            CustomCardTypeIcon(
              cardType: CardType.mastercard,
              cardImage: Image.asset(
                'assets/images/credit_card/mastercard.png',
                height: 48,
                width: 48,
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            CreditCardForm(
              formKey: formKey,
              obscureCvv: true,
              obscureNumber: true,
              cardNumber: cardNumber,
              cvvCode: cvvCode,
              isHolderNameVisible: true,
              isCardNumberVisible: true,
              isExpiryDateVisible: true,
              cardHolderName: cardHolderName,
              expiryDate: expiryDate,
              themeColor: Colors.blue,
              textColor: const Color.fromRGBO(0, 47, 50, 1),
              cardNumberDecoration: InputDecoration(
                labelText: 'Número de Tarjeta *',
                hintText: 'XXXX XXXX XXXX XXXX',
                hintStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(color: Colors.black),
                focusedBorder: border,
                enabledBorder: border,
                errorText: creditCardProvider.getCardNumberError,
              ),
              expiryDateDecoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(color: Colors.black),
                focusedBorder: border,
                enabledBorder: border,
                labelText: 'Fec Exp *',
                hintText: 'MM/AA',
                errorText: creditCardProvider.getExpiryDateError,
              ),
              cvvCodeDecoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(color: Colors.black),
                focusedBorder: border,
                enabledBorder: border,
                labelText: 'CVV *',
                hintText: 'XXX',
                errorText: creditCardProvider.getCvvCodeError,
              ),
              cardHolderDecoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(color: Colors.black),
                focusedBorder: border,
                enabledBorder: border,
                labelText: 'Nombre del Titular *',
                errorText: creditCardProvider.getCardHolderNameError,
              ),
              onCreditCardModelChange: (CreditCardModel? creditCardModel) {
                creditCardProvider.setCardNumber = creditCardModel!.cardNumber;
                creditCardProvider.setExpiryDate = creditCardModel.expiryDate;
                creditCardProvider.setCardHolderName =
                    creditCardModel.cardHolderName;
                creditCardProvider.setCvvCode = creditCardModel.cvvCode;
                creditCardProvider.setIsCvvFocused =
                    creditCardModel.isCvvFocused;
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ],
    );
  }
}

class _ShowCreditCardData extends StatelessWidget {
  const _ShowCreditCardData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final creditCardProvider = Provider.of<CreditCardProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Credit Card Data',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        _CreditCardData(
          fieldName: 'Número de tarjeta',
          fieldValue: creditCardProvider.getCardNumber,
        ),
        _CreditCardData(
          fieldName: 'Fecha de Expiración',
          fieldValue: creditCardProvider.getExpiryDate,
        ),
        _CreditCardData(
          fieldName: 'CVV',
          fieldValue: creditCardProvider.getCvvCode,
        ),
        _CreditCardData(
          fieldName: 'Nombre del Titular',
          fieldValue: creditCardProvider.getCardHolderName,
        ),
      ],
    );
  }
}

class _CreditCardData extends StatelessWidget {
  final String fieldName;
  final String fieldValue;

  const _CreditCardData(
      {Key? key, required this.fieldName, required this.fieldValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 15),
          Text(
            fieldName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            fieldValue,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
