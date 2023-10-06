import "package:flutter/material.dart";

class CustomButton extends StatefulWidget {
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isLeftActive = true;

  void toggleColors() {
    setState(() {
      isLeftActive = !isLeftActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: toggleColors,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: isLeftActive ? Colors.yellow : Colors.grey, // Cambia il colore
        ),
        child: Center(
          child: Text(
            isLeftActive ? 'Attivi' : 'Futuri',
            style: TextStyle(
              color: isLeftActive
                  ? Colors.grey
                  : Colors.black, // Cambia il colore del testo
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
