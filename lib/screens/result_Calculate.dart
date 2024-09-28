import 'package:flutter/material.dart';
  class ResultView extends StatelessWidget {
    double bmi ;
  ResultView({required this.bmi});
    String? status;
    String? state;

  @override
  Widget build(BuildContext context) {
    if (bmi < 18.5) {
      status = "Under Weight";
      state = "You are underweight. It is important to consult a nutritionist to get personalized advice and develop a healthy eating plan .";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      status = "Normal";
      state = "You are in a normal weight range. Keep up the good work by maintaining a balanced diet, regular exercise,  to stay fit and healthy.";

    } else if (bmi >= 25 && bmi < 29.9) {
      status = "Over Weight";
      state = "You are overweight. Consider adopting healthier eating habits and incorporating regular physical activity to reduce health risks.";
    } else if (bmi >= 30 && bmi < 34.9) {
      status = "Obese";
      state = "You are obese. It is highly recommended to consult a professional to create a structured weight management plan for better health.";
    } else if (bmi >= 35) {
      status = "Extremely Obese";
      state = "You are extremely obese. It is crucial to seek medical advice to explore treatment options and make lifestyle changes to improve your health.";
    }

    return Scaffold(
      backgroundColor: const Color(0xFF100c24),
      appBar: AppBar(

        backgroundColor:const Color(0xFF0c0c1c),
        centerTitle: true,
        title: const Text(
          "Result",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color:Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Your Result",
              style: TextStyle(
                  fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
            ),
           const SizedBox(height: 10,),
            Container(
              color:const Color(0xFF201c34),
              width: double.infinity,
             // height: 450,
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                 const SizedBox(height: 35,),
                  Text("$status", style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),),
                 const SizedBox(height: 40,),
                  Text("${bmi.toStringAsFixed(1)}", style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Colors.white),),
                 const SizedBox(height: 30,),
                  Container(
                    alignment:Alignment.center,
                    padding:const EdgeInsets.only(left: 10),
                      child: Text("$state", style: const TextStyle(fontSize: 24, color: Colors.white),)),
                  const SizedBox(height: 16,)
                ],
              ),
            ),
           //Spacer(),
            Container(
                alignment: Alignment.center,
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFF201c34),
                ),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child:const  Text(
                    "Re-Calculate",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                )
            ),
            const SizedBox(height: 16,)
          ],
        ),
      ),
    );
  }
}
