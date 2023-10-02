import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double firstnum=0.0;
  double secondnum=0.0;
  var input ="";
  var output ="";
  var operation ="";
  var hideinput=false;
  var outputsize = 34.0;
  onButtonClick(value){
   if(value=="AC"){
     input=" ";
     output=" ";
   }
   else if(value=="←"){
     if(input.isNotEmpty){
       input=input.substring(0,input.length-1);
     }
   }
   else if(value=="="){
     if( input.isNotEmpty){
     var userInput = input;
     userInput= input.replaceAll("×", "*");
     Parser p= Parser();
     Expression expression = p.parse(userInput);
     ContextModel cm =ContextModel();
     var finalValue = expression.evaluate(EvaluationType.REAL, cm);
     output = finalValue.toString();
     if(output.endsWith(".0")){
       output=output.substring(0,output.length-2);
     }
     input=output;
     hideinput=true;
     outputsize=52;
   }
   }
   else{
     input=input+value;
     hideinput=false;
     outputsize=34;
   }
   setState(() {

   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(

        children: [
          Expanded(child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            color: Colors.black54,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(hideinput ? '' : input,
              style:TextStyle(fontSize: 48,color: Colors.white) ,
              ),
             SizedBox(height: 20,),
              Text(output,
                style:TextStyle(fontSize: outputsize,color: Colors.white.withOpacity(0.7),) ,
              ),
              SizedBox(height: 30,)
            ],
          ),
          )),
          Row(
            children: [
              button(text: "AC", tColor: Colors.orangeAccent,
                  buttonBgColor: Colors.white24
              ),
              button(text: "←",tColor: Colors.orangeAccent, buttonBgColor: Colors.white24),
              button(text: "",buttonBgColor: Colors.transparent),
              button(text: "/", buttonBgColor: Colors.white24),
            ],
          ),
          Row(
            children: [
              button(text: "7"),
              button(text: "8"),
              button(text: "9"),
              button(text: "×", buttonBgColor: Colors.white24),
            ],
          ),
          Row(
            children: [
              button(text: "4"),
              button(text: "5"),
              button(text: "6"),
              button(text: "-", buttonBgColor: Colors.white24),
            ],
          ),
          Row(
            children: [
              button(text: "1"),
              button(text: "2"),
              button(text: "3"),
              button(text: "+", buttonBgColor: Colors.white24),
            ],
          ),
          Row(
            children: [
              button(text: "%",tColor: Colors.orangeAccent),
              button(text: "0"),
              button(text: "."),
              button(text: "=", buttonBgColor: Colors.orangeAccent),
            ],
          ),
        ],
      ),
    );
  }
    Widget button({
    text,tColor=Colors.white,buttonBgColor=Colors.white12
})
    {
    return
      Expanded(
          child: Container(//color: Colors.black87,
          margin:const EdgeInsets.all(5),
            child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
              ),
              padding: const EdgeInsets.all(20),
             backgroundColor: buttonBgColor,
            ),
            onPressed: ()=> onButtonClick(text),
                child: Text(text,style: TextStyle(
            fontSize: 25,
            color: tColor,
            fontWeight: FontWeight.bold,
        ),
        )
        ),
      ));
    }

}
