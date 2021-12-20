import 'package:flutter/material.dart';

class UpCommingMovie extends StatelessWidget {
  List? upComming;
  UpCommingMovie({ Key? key, this.upComming }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: upComming!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisExtent: 230,crossAxisSpacing:20), 
      itemBuilder: (context, index){
          return InkWell(
            onTap: (){

            },
              child: GridTile(
               
                child: Container(
                
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network("https://image.tmdb.org/t/p/w500"+upComming![index]['poster_path'],fit: BoxFit.cover,),
                      Text(upComming![index]['title']!=null?
                           upComming![index]['title']:"loading",
                           style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
                    ],
                    
                  )
                )
                )
          );
      });
  }
}