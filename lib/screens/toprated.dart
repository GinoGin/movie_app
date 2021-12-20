import 'package:flutter/material.dart';

class TopRated extends StatelessWidget {
  List? topRated;
  TopRated({ Key? key, this.topRated }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: topRated!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisExtent: 240,crossAxisSpacing:20), 
      itemBuilder: (context, index){
          return InkWell(
            onTap: (){

            },
              child: GridTile(
               
                child: Container(
                
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network("https://image.tmdb.org/t/p/w500"+topRated![index]['poster_path'],fit: BoxFit.cover,),
                      Text(topRated![index]['title']!=null?
                           topRated![index]['title']:"loading",
                           style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
                    ],
                    
                  )
                )
                )
          );
      });
  }
}