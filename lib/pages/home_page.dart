import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter1_app/models/cart.dart';
import 'package:flutter1_app/utils/routes.dart';
import 'package:flutter1_app/widgets/themes.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/add_to_cart.dart';
import 'home_page_detail.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var catalogjson = await rootBundle.loadString("assets/files/catalog.json");
    //final response = await http.get(Uri.parse(url));
    //final catalogjson = response.body;
    final decoderdata = jsonDecode(catalogjson);
    var productsdata = decoderdata["products"];
    CatalogModel.items = List.from(productsdata)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final dummylist=List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      backgroundColor: context.canvasColor,
      /*appBar: AppBar(
        title: Text("Catalog",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: /*ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context,index)=>ItemWidget
            (item: CatalogModel.items[index],
          ),
        ),*/
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 30,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context,index){
            final item=CatalogModel.items[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: GridTile(
                  header: Container(
                    padding: const EdgeInsets.all(12),
                    child:Text(item.name,style: TextStyle(color: Colors.white),),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                    ),
                  ),
                    child: Image.network(item.image),
                  footer:Container(
                    padding: const EdgeInsets.all(12),
                    child:Text("\$${item.price}",style: TextStyle(color: Colors.white),),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                ),
            );
          },
          itemCount: CatalogModel.items.length,
        ),
      ),
      drawer: MyDrawer(),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: MyTheme.darkBluishColor,
        child: Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32, //Edgeinsets.all(32)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App"
            .text
            .xl5
            .bold
            .color(MyTheme.darkBluishColor)
            .make(), // same as Text("CATALOG APP",style...)
        "Trending products".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetailPage(catalog: catalog),
              ),
            ),
            child: CatalogItem(catalog: catalog),
          );
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: CataLogImage(image: catalog.image),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              15.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  AddToCart(catalog: catalog)
                ],
              ).pOnly(right: 8.0),
            ],
          ),
        ),
      ],
    )).white.roundedLg.square(150).make().py16();
  }
}

class CataLogImage extends StatelessWidget {
  final String image;

  const CataLogImage({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .roundedLg
        .py8
        .color(Colors.white38)
        .make()
        .py20()
        .w40(context);
  }
}
