import 'package:flutter/material.dart';

class CreateTodo extends StatelessWidget {
   CreateTodo({ Key? key }) : super(key: key);
  final GlobalKey<FormState> createTodokey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: const Text("Create To-do"),
     ), 
     body: Form(
       key: createTodokey,
       child: ListView(
        children:[ TextFormField(
          validator: (value) {
            if (value!.isEmpty){
              return 'This Field must be empty';
            }
          },
         decoration: const InputDecoration(label: Text("Title"),
         ),
       ),
       const SizedBox(
         height: 100,
       ),
       TextFormField(
          validator: (value) {
            if (value!.isEmpty){
              return 'This Field must be empty';
            }
          },
         decoration: const InputDecoration(label: Padding(
           padding: EdgeInsets.only(bottom: 100),
           child: Text("Description"),
         ),
         ),
       ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                 validator: (value) {
            if (value!.isEmpty){
              return 'This Field must be empty';
            }
          },
                   decoration: const InputDecoration(label: Text("Start Date"),
                   ),
                 ),
            ),
          const SizedBox(width: 10,),
       Expanded(
         child: TextFormField(
            validator: (value) {
            if (value!.isEmpty){
              return 'This Field must be empty';
            }
          },
           decoration: const InputDecoration(label: Text("End Date")),
           ),
         ),]
       ),
       const SizedBox(
         height: 30,
       ),
       Padding(
         padding: const EdgeInsets.only(top:10, left: 100, right: 100),
         child: TextButton(onPressed: () {
           if(createTodokey.currentState!.validate()){
                // send to database
           }else{
             // dont send to database
           }
         }, 
         
         child: const Text("Create", style:  TextStyle(color: Colors.white, fontSize: 20,)
         ),
         style: TextButton.styleFrom(backgroundColor: Colors.blue),),
       )
          ],
        ),
     ),
      
      );
    
  }
}