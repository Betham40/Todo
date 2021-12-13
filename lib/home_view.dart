//This will allow you to use the widget in my app
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'create_todo_view.dart';

//This is the class of my home page
// ignore: camel_case_types
class MyTo_doApp extends StatelessWidget {
   MyTo_doApp({ Key? key }) : super(key: key);
  final List<Map<String, dynamic>> completedTask = [];

  final List<Map<String, dynamic>>  mydatabase = [

    {
      'title': 'My graduation ceremony',
      'description': 'It will take place at TTU park',
      'time': 'Yesterday',
      'paint': 'grey',
      'icon': 'notifications_outlined',
      'isCompleted': false
    },
    {
      'title': 'My lunch time',
      'description': 'Buy gob3 and plantain, add tuo zaafi for now',
      'time': 'Tomorrow',
      'paint': 'blue',
      'icon': 'notifications_outlined',
      'isCompleted': true
    },










  ];

  get index => null;



  @override
  Widget build(BuildContext context) {
    for (var element in mydatabase) {
      if (element ['isCompleted'] == true) {
        completedTask.add(element);
      }
    }
    //The scaffold is the root widget of our app 
    //(it has the AppBar, floatingAction button, e.t.c.)
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder:(context) {
          return  CreateTodo();
        }
        ));
      },
      child: const Icon(Icons.add,
      size: 40,
      ),
      ),
      backgroundColor:Colors.grey.shade100,
      // this shows the name of the interface, profile picture
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Center(
          child:  CircleAvatar(
            backgroundImage: NetworkImage("https://images.unsplash.com/photo-1633113215883-a43e36bc6178?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=700&q=60"),
            ),
        ),
          title: Text("My Task", style:TextStyle(color:Colors.indigo.shade900,),),
          actions:  [
            Icon(Icons.filter_list, color:Colors.indigo.shade900,),
            Icon(Icons.search, color:Colors.indigo.shade900,) 
          ],
          // this part shows the main functions of the App
          // this includes the card, the text, icons e.t.c.
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            TodoWidget(
              todo: "The family's trip to Finland next summer", 
              time: 'yestaday', 
              task: 'Plan the trip to Finland', 
              color: Colors.purpleAccent, 
            icon: Icons.notifications,),
            TodoWidget(todo: "", 
              time: 'Today 11:00', 
              task: "Plan Susan's birthday", 
              color: Colors.blue, 
            icon: Icons.notifications_outlined,),
            TodoWidget(
              todo: "Get tomatoes, lettuce, potatoes, green beans, cream and beef fillet. Also buy red wine at John's Wine Shop", 
              time: 'Today 15:00', 
              task: 'Groceries for dinner', 
              color: Colors.blue,
            icon: Icons.notifications_outlined,
            ),
            TodoWidget(
              todo: "Send the presentation to Bill", 
              time: 'Tomorrow', 
              task: 'Port projects', 
              color: Colors.grey, 
            icon: Icons.notifications_outlined,
            ),
            TodoWidget(
              todo: "", 
              time: 'Fri 30, Oct', 
              task: 'Take jacket for cleaning', 
              color: Colors.grey, 
            icon: Icons.notifications_outlined,
            ),
            TodoWidget(
              todo: "Install the latest update and check wireless connection", 
              time: '', 
              task: "Fix dad's PC", 
              color: Colors.grey, 
            icon: Icons.notifications_outlined,),
            TodoWidget(
              todo: "Talk to Monica about this trip", 
              time: '', 
              task: "Trip to Stockholm", 
              color: Colors.grey, 
            icon: Icons.notifications_outlined,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        // This is the card at the bottom of the hompage showing 
        // the completed task and number of completed task
        child: InkWell(
          onTap: (){
            showModalBottomSheet(context: context, builder: (context){
              return ListView.separated(itemBuilder: (context,index) {
                return TodoWidget(
                task: completedTask[index]['title'],
                todo: completedTask[index]['description'],
                time: completedTask[index]['time'],
                color: completedTask[index]['paint'.toString()],
                icon: completedTask[index]['icon'],
                );
              },
               separatorBuilder: (context, index) {
                 return const SizedBox(
                   height: 10,
                 );
               }, itemCount: completedTask.length);
               
               
            });
          },
          child: Card(
            color: const Color.fromRGBO(220, 229, 238, 1),
           child: Padding(
             padding: const EdgeInsets.all(15.0),
             child: Row(
               children: const [
                 Icon(Icons.check_circle, color: Color.fromRGBO(56, 53, 123, 1)),
                 SizedBox(width: 20,),
                 Text("Completed"),
                 Icon(Icons.arrow_drop_down_outlined, color: Color.fromRGBO(92, 98, 122, 1),),
                 Spacer(),
                 Text("24")
               ],
             ),
           ),
          ),
        ),
      ),
    );
  }
}
// this consists of the variables assigned to specific functions
class TodoWidget extends StatelessWidget {
  const TodoWidget({
    Key? key, required this.task, required this.todo, required this.time, required this.color, required this.icon,
  }) : super(key: key);
  final String task;
  final String todo;
  final String time;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: ListTile(
          leading: Icon(Icons.check_circle_outline, color:color,size: 29, ),
          title: Text(task, style: const TextStyle(color: Colors.indigo, fontSize: 15, fontWeight: FontWeight.bold)
          ),
          subtitle: Text( todo, maxLines: 3,overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.grey, fontSize: 10,),
          ),
          trailing: Padding(padding: const EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Icon(icon, size: 15, color: color,),
              Text(time, style: TextStyle(color: color,fontSize: 10,),
              )
              ],
          ),
          ),
        ),
        ),
    );
  }
}