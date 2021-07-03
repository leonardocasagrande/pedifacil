import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pedifacil/shared/models/product_model.dart';
import 'package:pedifacil/shared/themes/app_colors.dart';
import 'package:pedifacil/shared/themes/app_images.dart';
import 'package:pedifacil/shared/themes/app_text_styles.dart';
import 'package:pedifacil/shared/widgets/price_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection("restaurants")
      .doc(dotenv.env["RESTAURANT_ID"])
      .collection("products")
      .snapshots();

  Map<ProductModel, int> _productMap = HashMap();

  void _addProductToCart(ProductModel product) {
    _productMap.update(product, (value) => value + 1, ifAbsent: () => 1);
    setState(() {});
  }

  void _removeProductFromCard(ProductModel product) {
    _productMap.update(product, (value) => value - 1);
    if (_productMap[product] == 0) _productMap.remove(product);
    setState(() {});
  }

  double _calculateTotalPrice() {
    double _result = 0;
    _productMap.forEach((key, value) {
      _result += key.price * value;
    });
    return _result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          dotenv.env['RESTAURANT_NAME']!,
          style: AppTextStyles.appBarText,
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Aconteceu um erro\nPor favor, feche e abra o app',
                textAlign: TextAlign.center,
                style: AppTextStyles.errorText,
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SizedBox(
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                ),
                height: 120,
                width: 120,
              ),
            );
          }

          return SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      ProductModel data = ProductModel.fromMap(
                          document.data() as Map<String, dynamic>);
                      return InkWell(
                        onTap: () => _addProductToCart(data),
                        splashColor: AppColors.primary,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              isThreeLine: true,
                              title: Text(
                                data.name,
                                style: AppTextStyles.cardTitle,
                              ),
                              subtitle: data.description != null
                                  ? Text(
                                      data.description!,
                                      style: AppTextStyles.descriptionText,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  : null,
                              trailing: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: data.image != null
                                    ? Image.network(data.image!)
                                    : Image.asset(AppImages.noImage),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: Row(
                                children: [
                                  Text(
                                    "R\$ ${data.price.toStringAsFixed(2).replaceAll(".", ",")}",
                                    style: AppTextStyles.descriptionHighlight,
                                  ),
                                  Expanded(
                                    child: SizedBox(),
                                  ),
                                  if (_productMap.containsKey(data))
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: InkWell(
                                            onTap: () =>
                                                _removeProductFromCard(data),
                                            child: Icon(
                                              Icons.remove,
                                              size: 24,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Text(
                                            _productMap[data].toString(),
                                            style: AppTextStyles.countText,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () => _addProductToCart(data),
                                          child: Icon(
                                            Icons.add,
                                            size: 24,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ],
                                    )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Container(
                                height: 1,
                                color: Colors.grey[300],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                PriceBar(
                  visible: _productMap.length > 0,
                  price: _calculateTotalPrice(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
