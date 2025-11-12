import 'package:flutter/material.dart';
import 'package:football_shop/widgets/left_drawer.dart';

class ProductFormPage extends StatefulWidget {
    const ProductFormPage({super.key});

    @override
    State<ProductFormPage> createState() => ProductFormPageState();
}

class ProductFormPageState extends State<ProductFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    int _price = 0;
    // === 1. TAMBAH VARIABEL STATE _stock ===
    int _stock = 0; 
    String _description = "";
    String _category = "new"; // default (Spasi dihilangkan)
    String _thumbnail = "";
    bool _isFeatured = false; // default

    final List<String> _categories = [
      'new',
      'apparel',
      'kids',
      'brands',
      'footwear',
      'equipment',
      'sale',
    ];

    final TextEditingController _priceController = TextEditingController();
    // === 2. TAMBAH CONTROLLER UNTUK _stock ===
    final TextEditingController _stockController = TextEditingController();

    @override
    void dispose() {
      _priceController.dispose();
      _stockController.dispose();
      super.dispose();
    }
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Add Product Form',
              ),
            ),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          drawer: LeftDrawer(),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  // === Name ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Nama Produk",
                        labelText: "Nama Produk",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.blue, 
                          ),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _name = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Nama produk tidak boleh kosong!";
                        }
                        return null;
                      },
                    ),
                  ),
                  // === Harga ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _priceController,
                      keyboardType: TextInputType.number, 
                      decoration: InputDecoration(
                        hintText: "Harga produk",
                        labelText: "Harga produk",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.blue, 
                          ),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          if (value != null && value.isNotEmpty) {
                            try {
                              _price = int.parse(value);
                            } catch (e) {
                              _price = 0;
                            }
                          }
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Harga produk tidak boleh kosong!";
                        }
                        if (int.tryParse(value) == null) {
                            return "Harga harus berupa angka!";
                        }
                        if (int.parse(value) <= 0) {
                            return "Harga harus lebih dari 0!";
                        }
                        return null;
                      },
                    ),
                  ),

                  // === 3. STOCK (BARU DITAMBAHKAN) ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _stockController,
                      keyboardType: TextInputType.number, 
                      decoration: InputDecoration(
                        hintText: "Stok produk",
                        labelText: "Stok produk",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.blue, 
                          ),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          // Mencoba parse ke int
                          if (value != null && value.isNotEmpty) {
                            try {
                              _stock = int.parse(value);
                            } catch (e) {
                              _stock = 0; 
                            }
                          }
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Stok produk tidak boleh kosong!";
                        }
                        if (int.tryParse(value) == null) {
                            return "Stok harus berupa angka!";
                        }
                         // Stok boleh 0, tapi tidak boleh negatif
                        if (int.parse(value) < 0) {
                            return "Stok tidak boleh negatif!";
                        }
                        return null;
                      },
                    ),
                  ),

                  // === Description ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "Deskripsi produk",
                        labelText: "Deskripsi produk",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.blue, 
                          ),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _description = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Deskripsi produk tidak boleh kosong!";
                        }
                        return null;
                      },
                    ),
                  ),

                  // === Category ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: "Kategori",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.blue, 
                          ),
                        ),
                      ),
                      // Pastikan nilai default _category sudah diatur ('new')
                      value: _category.trim(), 
                      items: _categories
                          .map((cat) => DropdownMenuItem(
                                value: cat,
                                child: Text(
                                    cat[0].toUpperCase() + cat.substring(1)),
                              ))
                          .toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _category = newValue!;
                        });
                      },
                    ),
                  ),

                  // === Thumbnail URL ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "URL Thumbnail (opsional)",
                        labelText: "URL Thumbnail",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.blue, 
                          ),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _thumbnail = value!;
                        });
                      },
                    ),
                  ),

                  // === Is Featured ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SwitchListTile(
                      title: const Text("Tandai sebagai Produk Unggulan"),
                      value: _isFeatured,
                      onChanged: (bool value) {
                        setState(() {
                          _isFeatured = value;
                        });
                      },
                    ),
                  ),
                  // === Tombol Simpan ===
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Produk berhasil disimpan!'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Name: $_name'),
                                        Text('Harga: $_price'),
                                        // === 4. TAMPILKAN _stock DI POP-UP ===
                                        Text('Stok: $_stock'), 
                                        Text('Deskripsi: $_description'),
                                        Text('Kategori: $_category'),
                                        Text('Thumbnail: $_thumbnail'),
                                        Text(
                                          'Unggulan: ${_isFeatured ? "Ya" : "Tidak"}'),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        _formKey.currentState!.reset();
                                        _priceController.clear();
                                        _stockController.clear(); // Bersihkan stock
                                        setState(() {
                                            _price = 0;
                                            _stock = 0;
                                            _isFeatured = false;
                                            _category = 'new';
                                        });
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ),
          ),
        );
    }
}