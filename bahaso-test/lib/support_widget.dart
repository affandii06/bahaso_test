import 'package:flutter/material.dart';


class CustomButton extends StatefulWidget {
  Color? setColor;
  double? setHeight;
  double? setWidth;
  String? setText;
  void Function()? action;
  CustomButton({
    this.setColor,
    this.setHeight,
    this.setWidth,
    this.setText,
    this.action,
    Key? key }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(widget.setColor,),
      ),
      onPressed: widget.action,
      child: Container(
        height: widget.setHeight,
        width: widget.setWidth,
        child: Center(child: Text(widget.setText!))
      )
    );
  }
}

class CustomFormField extends StatefulWidget {
  String? iconAssets;
  String? setHint;
  bool? setObsecure;
  double? setShape;
  TextEditingController? setController;
  TextInputType? setInputType;
  bool? setBorder;
  CustomFormField({
    this.iconAssets,
    this.setHint,
    this.setObsecure,
    this.setShape,
    this.setController,
    this.setInputType,
    this.setBorder,
    Key? key }) : super(key: key);

  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {

  bool active = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.setController,
      obscureText: widget.setObsecure == true ? active == false ? true : false : false,
      keyboardType: widget.setInputType ?? TextInputType.text,
      decoration: InputDecoration(
        // label: Text(widget.setHint!),
        hintText: widget.setHint,
        enabledBorder: widget.setBorder == true ? OutlineInputBorder(      
          borderSide: const BorderSide(color: Colors.grey, width: 1),   
          borderRadius: BorderRadius.circular(widget.setShape ?? 10)
        ) : null,  
        focusedBorder:  widget.setBorder == true ? OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 1),
          borderRadius: BorderRadius.circular(widget.setShape ?? 10)
        ) : null,
        prefixIcon: widget.iconAssets != null ? Image.asset(widget.iconAssets!) : null,
        suffixIcon: widget.setObsecure == true ? GestureDetector(
          onTap: (){
            setState(() {
              active = !active;
            });
          },
          child: Icon(
            active == false ? Icons.visibility_off : Icons.visibility,
            color: active == false ? Colors.grey : Colors.blue,
          ),
        ):null
      ),
    );
  }
}