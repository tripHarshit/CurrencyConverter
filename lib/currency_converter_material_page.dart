import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPage();
}

class _CurrencyConverterMaterialPage
    extends State<CurrencyConverterMaterialPage> {
  double _result = 0.0;
  TextEditingController controller = TextEditingController();

  void _convert() {
    setState(() {
      final input = double.tryParse(controller.text);
      _result = (input ?? 0) * 85;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Currency Converter"),
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConvertedValue(result: _result),
            CurrencyInputTextField(controller: controller),
            ConvertButton(onPress: _convert),
          ],
        ),
      ),  
    );
  }
}

class ConvertedValue extends StatelessWidget {
  final double result;
  const ConvertedValue({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Text(
      "₹ $result",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 44,
        color: Colors.black,
      ),
    );
  }
}

class CurrencyInputTextField extends StatelessWidget {
  final TextEditingController controller;

  const CurrencyInputTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: 'Amount',
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.5),
            borderRadius: BorderRadius.circular(14),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          prefixIcon: Icon(Icons.monetization_on_rounded),
          prefixIconColor: Colors.black,
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: TextInputType.numberWithOptions(decimal: true),
      ),
    );
  }
}

class ConvertButton extends StatelessWidget {
  final VoidCallback onPress;
  ConvertButton({super.key, required this.onPress});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: TextButton(
        onPressed: onPress,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.black),
          minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
        ),
        child: Text("Convert", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
