import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     home: Scaffold(
       appBar: AppBar(
         title: Text("Photo Gallary"),
         centerTitle:true,
       ),
         body: Padding(
           padding: EdgeInsets.only(bottom: 30,top: 20),
           child: ListView(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Scrollbar(child: Text("Welcome To My Photo Gallary!",
                     style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),),
                 ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextField(
                 decoration: InputDecoration(
                     hintText:("Search for Photos..."),
                     hintStyle: TextStyle(color: Colors.black54),
                     border: OutlineInputBorder(
                         borderSide:BorderSide(color: Colors.black87)
                     )
                 ),
               ),
             ),
                 Container(
                   height: 300,
                   child: Grid(),
                 ),
                 Container(
                     height: 210,
                     child: list()),
                 UploadButton()
           ],
         ),
    ),),

   );
  }
  
}
class Grid extends StatelessWidget{
  List<String> ImageUrl=[
    'https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/9/99/Brooks_Chase_Ranger_of_Jolly_Dogs_Jack_Russell.jpg',
    'https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcRnfdkeVZ9JofIVsToWj1RtzX58o-0w7r1trFDzw51u-qM8yTFZ9aTIWajIDkkiT26KBxRsSTjmzOAeLDY'
    ,'https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/9/99/Brooks_Chase_Ranger_of_Jolly_Dogs_Jack_Russell.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg'

  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: ImageUrl.length,
        itemBuilder: (BuildContext context, int index) {
      return Column(
        children: [
          Padding(padding:EdgeInsets.all(5)),

          GestureDetector(onTap:(){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Image Clicked"),
                  duration: Duration(seconds: 2),
                )
            );
          },
            child: Image.network(
              ImageUrl[index],
              fit: BoxFit.cover,
              height: 100,
              width: 120,
            ),
          ),
          Text("Photo ${index.toString()}"),


        ],

      );

    },);
  }

}
class list extends StatelessWidget{
  List<String> Photos=[
    'https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/9/99/Brooks_Chase_Ranger_of_Jolly_Dogs_Jack_Russell.jpg',
    'https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcRnfdkeVZ9JofIVsToWj1RtzX58o-0w7r1trFDzw51u-qM8yTFZ9aTIWajIDkkiT26KBxRsSTjmzOAeLDY'

  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Photos.length,
        itemBuilder: (context,index){
          return Padding(
              padding:EdgeInsets.all(6),
              child:Row(
                children: [
                ClipOval(child: Image.network(Photos[index],height:40,width: 40,fit: BoxFit.cover,)),

                      SizedBox(
                        width: 320,
                        height: 60,
                        child: ListTile(
                          title: Text("Photo ${index.toString()}"),
                          subtitle:Text("Description for photo ${index.toString()}"),
                        ),
                      ),
                    ],
                  ),

          );
        });
  }

}
class UploadButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(shape:BoxShape.circle,color: Colors.blueAccent),
          child: IconButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Photos Uploaded Successfully!'),
                duration: Duration(seconds: 3), // Adjust the duration as needed
              ),
            );
          }, icon:Icon(Icons.upload_rounded,size:40,color: Colors.white)),

      ),
    );
  }

}

