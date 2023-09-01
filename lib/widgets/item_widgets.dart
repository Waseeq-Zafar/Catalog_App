import 'package:flutter/material.dart';
import '../models/catalog.dart';



class ItemWidget extends StatelessWidget{
  final Item item;

  const ItemWidget({ Key? key,  required this.item}):super(key: key);
  @override
  Widget build(BuildContext context){
    return Card(
      child: ListTile(
        onTap: (){
          print("${item.name} pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc,style: TextStyle(color: Colors.black),),
        trailing: SizedBox(
          height: 100,width: 100,
          child: Text("\$${item.price}",
          textScaleFactor: 1.2,
            style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
          ),
        ),
      ),
    );
  }
}