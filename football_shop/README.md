<!-- # football_shop

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference. -->

=============== 💛💛💛 TUGAS 7 💛💛💛 ===============
==============================
1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
    Widget tree adalah struktur hierarki yang menggambarkan bagaimana semua widget (komponen UI) saling berhubungan dan membentuk tampilan aplikasi Flutter.
    Setiap elemen UI di Flutter — seperti teks, tombol, kolom, atau baris — adalah sebuah widget.
    hubungan parent–child (induk–anak): 
    - Parent widget adalah widget yang membungkus atau memuat widget lain di dalamnya.
    - Child widget adalah widget yang berada di dalam parent-nya dan biasanya menerima aturan atau gaya dari parent tersebut.

    Contoh:
        ```
        Column(
        children: [
            Text('Halo'),
            ElevatedButton(onPressed: () {}, child: Text('Klik'))
        ],
        )
        ```
    Di sini, `Column` adalah parent, sedangkan `Text` dan `Elevated Button` adalah child. 

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
    
    Daftar Widget pada football_shop tugas 7:

    1. MaterialApp
        Root widget aplikasi.
        Mengatur tema, title, navigasi, dan keseluruhan struktur aplikasi berbasis Material Design.
    2. Scaffold
        Menyediakan kerangka dasar halaman.
        Memiliki AppBar, body, dan bisa ditambahkan FloatingActionButton atau Drawer.
    3. AppBar
        Menampilkan bilah atas halaman dengan judul dan warna latar belakang.
    4. Padding
        Memberikan jarak di sekitar widget anak.
        Di sini digunakan untuk memberi jarak di seluruh body halaman.
    5. Column
        Menyusun widget secara vertikal.
        Digunakan untuk mengatur tampilan InfoCard dan GridView secara berurutan.
    6. Row
        Menyusun widget secara horizontal.
        Digunakan untuk menampilkan 3 InfoCard sejajar.
    7. InfoCard
        Widget custom untuk menampilkan informasi seperti NPM, Nama, dan Kelas.
        Menggunakan Card, Container, Column, Text, dan SizedBox di dalamnya.
    8. SizedBox
        Memberikan jarak vertikal/horizontal antar widget.
        Contoh: jarak antara Row InfoCard dan welcome text.
    9. Center
        Memusatkan widget anak di layar.
        Digunakan untuk memusatkan teks sambutan dan GridView.
    10. Padding (lagi)
        Memberi jarak pada teks sambutan.
    11. Text
        Menampilkan teks di layar.
        Contohnya: judul AppBar, nama pengguna, kelas, dan teks sambutan.
    12. GridView.count
        Menampilkan beberapa item dalam bentuk grid.
        Di sini digunakan untuk menampilkan ItemCard dalam 3 kolom.
    13. ItemCard
        Widget custom untuk menampilkan tombol dengan ikon dan teks.
        Menggunakan Material, InkWell, Container, Center, Column, Icon, Text, dan Padding.
        Mendukung aksi tap dengan SnackBar.
        Material
        Memberikan efek visual seperti warna latar belakang dan border radius.
    14. InkWell
        Membuat widget bisa disentuh (tap) dan memberi efek animasi.
    15. Container
        Mengatur ukuran, padding, dan posisi widget di dalamnya.
    16. Icon
        Menampilkan ikon sesuai IconData (misal Icons.shop).
    17. Card (di InfoCard)
        Menampilkan kotak dengan bayangan dan bentuk sudut melengkung.
    18. MediaQuery
        Digunakan untuk menyesuaikan ukuran widget dengan ukuran layar perangkat.

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
    
    MaterialApp berfungsi sebagai pembungkus utama aplikasi yang menggunakan Material Design.
    Ia menyediakan banyak fitur penting seperti:
    Tema (warna, font, gaya global)
    Navigasi antar halaman (Navigator)
    Manajemen route
    Lokalization (bahasa)
    Debug banner control
    Widget ini sering dipakai sebagai root widget karena ia menjadi fondasi seluruh tampilan dan logika navigasi aplikasi Flutter berbasis Material Design.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
    
    StatelessWidget	
        Penjelasan: Widget yang tidak memiliki perubahan data atau keadaan (state) setelah dibangun.	
        Kapan Digunakan: Jika tampilan tidak berubah, misalnya label teks statis, ikon, atau tombol sederhana.
    StatefulWidget	
        Penjelasan: Widget yang bisa berubah seiring waktu karena adanya state (misalnya input, animasi, counter, dsb).	
        Kapan Digunakan: Jika tampilan perlu diperbarui saat data berubah, seperti ketika menekan tombol untuk menambah angka.

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

    BuildContext adalah objek yang merepresentasikan posisi suatu widget dalam widget tree.
    Ia digunakan untuk mencari dan mengakses:
    Widget ancestor (induk di atasnya)
    Tema (Theme.of(context))
    Navigator (Navigator.of(context))
    Scaffold (ScaffoldMessenger.of(context))
    Di metode build(), parameter BuildContext context digunakan agar widget bisa “tahu” posisinya di dalam tree dan bisa berinteraksi dengan widget lain di atasnya.

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

    Hot Reload
        Memuat ulang perubahan kode tanpa menghapus state aplikasi.
        → Cocok saat kamu mengubah tampilan, teks, atau logika UI kecil.
        State (misalnya nilai counter) tetap ada.
    Hot Restart
        Menjalankan ulang seluruh aplikasi dari awal.
        → State akan hilang dan aplikasi kembali ke kondisi awal.
        Cocok jika kamu mengubah variabel global, struktur kode besar, atau inisialisasi awal aplikasi.
==============================



=============== 💛💛💛 TUGAS 8 💛💛💛 ===============
==============================

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

    Kedua metode ini mengelola *stack* halaman aplikasi secara berbeda:

    💛 Metode: Navigator.push()

    Metode ini menambahkan rute (halaman) baru di atas tumpukan yang sudah ada. Halaman sebelumnya tetap berada di tumpukan sehingga pengguna dapat kembali ke halaman tersebut dengan tombol *back*.

    **Penggunaan di Projek:** Ideal untuk perpindahan ke halaman sekunder, seperti dari **Home Page** ke **Add Product**

    💛 Metode: Navigator.pushReplacement()

    Metode ini mengganti halaman yang saat ini aktif dengan halaman baru, menghapus halaman lama dari tumpukan. Pengguna tidak bisa kembali ke halaman yang diganti.

    **Penggunaan di Projek:** Ideal untuk navigasi utama (misalnya, dari halaman lain kembali ke **Home Page** via `Drawer`)


2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

    Widget struktural seperti `Scaffold`, `AppBar`, dan `Drawer` adalah fondasi untuk membangun struktur halaman yang konsisten di seluruh aplikasi:

    💛 Widget: Scaffold

    `Scaffold` menyediakan kerangka dasar untuk setiap halaman (tempat meletakkan `AppBar`, *body*, dan `Drawer`). Penggunaannya memastikan setiap halaman memiliki struktur dasar yang seragam.

    💛 Widget: AppBar

    `AppBar` menjamin semua halaman memiliki *header* (judul dan aksi) dengan gaya dan warna yang konsisten. Contohnya, menggunakan `backgroundColor: Colors.indigo` di setiap halaman memperkuat identitas visual *brand*.

    💛 Widget: Drawer

    `Drawer` menyediakan menu navigasi global yang dapat diakses dari mana saja di aplikasi. Ini memastikan alur perpindahan antar halaman utama (Home, Add Product) mudah dan konsisten.

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

    Penggunaan *layout widget* berikut sangat penting untuk fungsionalitas dan desain formulir yang baik (`productlist_form.dart`):

    💛 Widget: Padding

    `Padding` memberikan *whitespace* di sekitar elemen input. Ini mencegah elemen menempel ke tepi layar atau elemen lainnya, yang pada akhirnya meningkatkan estetika dan keterbacaan antarmuka.

    **Contoh Penerapan:** Digunakan untuk memberi jarak `8.0` di sekeliling setiap `TextFormField`.

    💛 Widget: SingleChildScrollView

    `SingleChildScrollView` memungkinkan *scrolling* pada konten halaman. Ini sangat penting untuk mencegah *overflow error* ketika formulir panjang atau *keyboard* virtual muncul.

    **Contoh Penerapan:** Digunakan sebagai *wrapper* di sekitar `Column` utama formulir.

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

    Konsistensi visual dicapai dengan menyesuaikan tema aplikasi (biasanya di `main.dart`) menggunakan `ThemeData` dan `ColorScheme`:

    💛 Implementasi Tema

    Aplikasi Football Shop menggunakan warna `Colors.blue` (biru tua) sebagai warna primer. Warna ini diterapkan secara konsisten pada elemen-elemen kunci seperti `AppBar` (latar belakang) dan Tombol Utama (`ElevatedButton` Save).

    💛 Manfaat Konsistensi

    Mengatur warna tema di tingkat aplikasi melalui `ThemeData` memastikan setiap *widget* standar (seperti *checkbox*, *progress indicator*, atau *border* fokus) akan secara otomatis mengambil warna *brand* yang telah ditentukan. Hal ini menciptakan identitas visual yang profesional dan konsisten.
==============================







