import 'package:flutter/material.dart';

class ConfirmOrderScreen extends StatefulWidget {
  const ConfirmOrderScreen({Key? key}) : super(key: key);

  @override
  _ConfirmOrderScreenState createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  bool _isProcessingOrder = false; // flag to show progress indicator

  void _confirmOrder() async {
    setState(() {
      _isProcessingOrder = true;
    });

    // simulate processing order for 2 seconds
    await Future.delayed(Duration(seconds: 2));

    // show success message and navigate back to table selection screen
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Order Confirmed!"),
          content: Text("Your order has been confirmed."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context); // dismiss dialog
                Navigator.pop(context); // navigate back to table selection screen
              },
            ),
          ],
        );
      },
    );

    setState(() {
      _isProcessingOrder = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm Order"),
        backgroundColor: Color(0xFFE1B812),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_image.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Are you sure you want to confirm your order?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: _isProcessingOrder
                    ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
                    : Text("Confirm"),
                onPressed: _isProcessingOrder ? null : _confirmOrder,

              ),
            ],
          ),
        ),
      ),
    );
  }
}
