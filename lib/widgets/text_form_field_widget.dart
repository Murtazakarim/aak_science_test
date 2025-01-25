import 'package:aakscience_test/appStyle/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class TextFormFieldWidget extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final Icon icon;
  bool? isObscureText;
  final Function (String?) onChange;
  final String? Function(String?) validator;

   TextFormFieldWidget({super.key,required this.onChange,required this.label,this.isObscureText,required this.controller,required this.icon,required this.validator});

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value){
          widget.onChange(value);
      },
      decoration: InputDecoration(
        label: Text(widget.label,style: GoogleFonts.poppins(color: KAppStyle.blackColor,fontSize: 16),),
        prefixIcon: widget.icon,
        suffixIcon: widget.isObscureText != null ?IconButton(onPressed: (){

           if(widget.isObscureText == true){
             setState(() {
               widget.isObscureText = false;
             });
           }else{
             setState(() {
               widget.isObscureText = true;
             });

           }
        }, icon:widget.isObscureText == true ? Icon(Icons.visibility): Icon(Icons.visibility_off)): null,
        contentPadding: EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: KAppStyle.blackColor),
        ),
        errorStyle: GoogleFonts.poppins(color: Colors.red,fontSize: 14),
      ),
      obscureText:widget.isObscureText ??false,
      validator: widget.validator,
    );
  }
}
