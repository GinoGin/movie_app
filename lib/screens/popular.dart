import 'package:flutter/material.dart';

class PopularMovie extends StatelessWidget {
  List? popular;
  PopularMovie({ Key? key, this.popular }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: popular!.length,
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
                      Image.network("https://image.tmdb.org/t/p/w500"+popular![index]['poster_path'],fit: BoxFit.cover,),
                      Text(popular![index]['title']!=null?
                           popular![index]['title']:"loading",
                           style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
                    ],
                    
                  )
                )
                )
          );
      });
  }
}