import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AddingButton extends StatelessWidget {
  final GestureTapCallback onTap;
  const AddingButton({
    Key? key, 
    required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(28),
      splashColor: Colors.amber,
      onTap: ()=> onTap(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 7),
        padding: const EdgeInsets.all(5),
        height: 28,
        width: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.amber,
          border: Border.all(color: Colors.white),
        ),
        child: const Center(
          child: Icon(
            CupertinoIcons.add,
            size: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
    
  }
}
