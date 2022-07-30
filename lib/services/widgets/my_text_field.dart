import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'my_text.dart';

class MyTextField extends StatefulWidget {
  String hintText;
  TextEditingController controller;
  String label;
  String? prefixIconPath;
  Function(String c)? onChanged;
  MyTextField({
    Key? key,
    this.label = "",
    this.hintText = "",
    required this.controller,
    this.prefixIconPath,
    this.onChanged,
  }) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  FocusNode myFocusNode = new FocusNode();

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        child: TextField(
          onTap: _requestFocus,
          focusNode: myFocusNode,
          controller: widget.controller,
          inputFormatters: const <TextInputFormatter>[
            // FilteringTextInputFormatter.digitsOnly
          ],
          // keyboardType: TextInputType.number,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            floatingLabelAlignment: FloatingLabelAlignment.start,

            // focusedBorder: OutlineInputBorder(
            //   // width: 0.0 produces a thin "hairline" border
            //   borderRadius: BorderRadius.circular(8),

            //   borderSide: const BorderSide(color: Color(0xff00C1D5)),
            // ),
            label: myText(
                txt: widget.label,
                // color: Color(0xff00C1D5),
                color: myFocusNode.hasFocus
                    ? Color(0xff00C1D5)
                    : Color(0xff9DA3A3),
                fontSize: 16,
                fontWeight: FontWeight.w500),
            // enabledBorder: OutlineInputBorder(
            //   // width: 0.0 produces a thin "hairline" border
            //   borderRadius: BorderRadius.circular(8),
            //   borderSide: const BorderSide(color: Color(0xffD7D8D9)),
            // ),
            // border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            border: InputBorder.none,
            prefixIcon: widget.prefixIconPath == null
                ? const Icon(
                    Icons.smart_toy_outlined,
                    color: Colors.grey,
                  )
                : ImageIcon(
                    AssetImage(widget.prefixIconPath!),
                    color: const Color(0xff9DA3A3),
                    size: 24,
                  ),
            hintText: widget.label,
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
        ));
  }
}
