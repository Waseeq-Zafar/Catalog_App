import 'package:flutter/material.dart';
import 'package:flutter1_app/widgets/add_to_cart.dart';
import 'package:flutter1_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(catalog: catalog).wh(120, 50),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.convey,
              edge: VxEdge.top,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4
                        .color(MyTheme.darkBluishColor)
                        .bold
                        .make(),
                    catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                    15.heightBox,
                    "iawhfuaweghf8ewafghihwfiuwgqffwqfuaewyfiuoegqwf879gewfjgedfiuewgf7gewjkfgeufgh8uejbv uhtduycdtyexsyurytfvyuvguigiiouh8ohewfkafi"
                        .text
                        .textStyle(context.captionStyle)
                        .make()
                        .p16(),
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
