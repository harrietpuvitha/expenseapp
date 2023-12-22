import 'package:expense_tracker/color.dart';
import 'package:flutter/material.dart';

class BottomSheetex extends StatefulWidget {
  const BottomSheetex({super.key});

  @override
  State<BottomSheetex> createState() => _BottomSheetexState();
}

class _BottomSheetexState extends State<BottomSheetex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        title: Text("BotttomSheet",
        style: TextStyle(
          color: Colors.white
        ),),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            showModalBottomSheet(context: context,
                builder:(BuildContext context){
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 250,
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          Icon(Icons.photo_camera_back,
                          color: Colors.grey,),
                          SizedBox(width: 25,),
                          Text("Photo",
                          style: TextStyle(
                            fontSize: 16
                          ),),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          Icon(Icons.music_note,
                            color: Colors.grey,),
                          SizedBox(width: 25,),
                          Text("Music",
                            style: TextStyle(
                                fontSize: 16
                            ),),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          Icon(Icons.video_call_sharp,
                            color: Colors.grey,),
                          SizedBox(width: 25,),
                          Text("Video",
                            style: TextStyle(
                                fontSize: 16
                            ),),
                        ],
                      ),
                      SizedBox(height: 30,),
                  Row(
                    children: [
                      Icon(Icons.share,
                        color: Colors.grey,),
                      SizedBox(width: 25,),
                      Text("Share",
                        style: TextStyle(
                            fontSize: 16
                        ),),
                    ],
                  ),
                    ],
                  ),
                ),
              );
                }
            );
  },
          child: Text("Click me",
          style: TextStyle(
            color: Colors.white
          ),),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
    
    // shape: const RoundedRectangleBorder(
    // borderRadius: BorderRadius.all(
    // Radius.circular(10),
            backgroundColor: Colors.green
          )
          ),
    

        ),


    );
  }
}
