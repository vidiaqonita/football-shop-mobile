import 'package:flutter/material.dart';
import 'package:football_shop/models/product_entry.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'package:football_shop/screens/product_detail.dart';
import 'package:football_shop/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

// ignore: constant_identifier_names
const String BASE_URL = "http://localhost:8000"; 

class ProductEntryListPage extends StatefulWidget {
  // 1. TAMBAHKAN PARAMETER filterByUser
  final bool filterByUser;

  const ProductEntryListPage({
    super.key, 
    this.filterByUser = false, // Default: false (tampilkan semua)
  });

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  
  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    // 2. MODIFIKASI LOGIKA URL BERDASARKAN filterByUser
    String url;
    if (widget.filterByUser) {
      // Panggil URL untuk produk pengguna yang login
      url = '$BASE_URL/my-products-json/'; // <--- ASUMSI URL BARU DI DJANGO
    } else {
      // Panggil URL untuk semua produk (default)
      url = '$BASE_URL/json/';
    }

    final response = await request.get(url);
    
    // Decode response to json format
    var data = response;
    
    // Convert json data to ProductEntry objects
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        // Pastikan Anda menggunakan ProductEntry.fromJson
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        // Ganti judul berdasarkan filter
        title: Text(widget.filterByUser ? 'My Product List' : 'All Product List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData || snapshot.data!.isEmpty) { // Periksa juga jika list kosong
              return Center( // Pusatkan pesan jika tidak ada data
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.filterByUser 
                        ? 'You haven\'t added any products yet.' 
                        : 'There are no products in football shop yet.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductEntryCard(
                  product: snapshot.data![index],
                  onTap: () {
                    // Navigate to product detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          product: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}