import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final IconData? icone;
  final String titulo;
  final Function()? onTap;

  const ButtonCustom({
    Key? key,
    this.icone,
    required this.titulo,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange[300],
          borderRadius: BorderRadius.circular(10),
        ),
        height: 40,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(titulo),
            Icon(icone),
          ],
        ),
      ),
    );
  }
}
