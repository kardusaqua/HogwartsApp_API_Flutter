# Hogwarts App

# Persiapan Project Flutter:
1. Menentukan nama aplikasi dan kebutuhan aplikasi yang ingin dibuat (Hogwarts App).
2. Identifikasi API yang akan digunakan.

# Pembuatan Arsitektur:
1. Buat folder "app" di dalam direktori "lib".
2. Di dalam folder "app", buat sub-folder "view", "controllers", "services", dan "models".

# Pembuatan File-FIle dalam Arsitektur:
1. Di dalam folder "view", buat file "home.dart".
2. Di dalam folder "controllers", buat file "character_controller.dart" dengan kelas "CharacterController" yang extends "ChangeNotifier". Kelas ini akan digunakan untuk menyimpan data dalam variabel.
3. Di dalam folder "models", buat file "character_model.dart" untuk parsing JSON ke dalam Dart. Sesuaikan struktur file model dengan struktur API yang akan digunakan.
4. Di dalam folder "services", buat file "remote_service.dart" untuk mengelola layanan API menggunakan package Dio.

# Konfigurasi Main.dart:
1. Di file "main.dart", wrap "MaterialApp" dengan "MultiProvider". Pastikan provider berhubungan dengan kelas "CharacterController".
2. Integrasikan REST API pada aplikasi menggunakan provider.

# Pengaturan Constants.dart:
1. Buat file "constants.dart" sejajar dengan folder "app". Cantumkan URL API sebagai baseUrl di dalamnya.

# Pembuatan Tampilan:
1. Di folder "view", buat tampilan mulai dari "home.dart". Tampilan ini mencakup elemen-elemen seperti home, character_list dengan listview, dan navigator ke detail page.
2. Detail page memungkinkan pengambilan lebih banyak data dari "CharacterModel".
3. Tambahkan menu "favorite page" di mana pengguna dapat mengklik simbol hati pada setiap karakter, dan karakter tersebut akan muncul di "favorite page" menggunakan listview.

# Kelas RemoteServices:
1. Dalam proyek Flutter, kelas "RemoteServices" berfungsi utama untuk mengambil data karakter dari sumber eksternal.
2. Kelas ini menggunakan library Dio untuk melakukan HTTP GET request ke URL yang ditentukan dalam variabel "baseUrl".
3. Metode statis "fetchCharacter" mengembalikan Future<List<CharacterModel>>.
4. Jika respons berhasil dengan status code 200, data dikonversi menjadi list objek "CharacterModel" menggunakan metode "fromJson".
5. Jika tidak, metode melempar exception dengan pesan 'Failed to load'.

# Hubungan Antara View, Controller, dan Model:

1. # Hubungan Antar Komponen:
   - **View:** Bertanggung jawab untuk menampilkan data dalam bentuk grafis kepada pengguna.
   - **Controller:** Mengatur bagaimana data akan ditampilkan di "view" dan menangani logika aplikasi.
   - **Model:** Berfungsi mencari dan mengolah data, biasanya merupakan representasi struktural dari data yang diambil dari sumber eksternal.

2. # Aliran Data:
   - **View -> Controller:** View dapat mengirim permintaan data ke controller untuk mendapatkan informasi yang diperlukan.
   - **Controller -> Model:** Controller meneruskan permintaan data ke model untuk diproses.
   - **Model -> Controller:** Model mengirimkan data yang sudah diolah kembali ke controller.
   - **Controller -> View:** Data yang telah diatur oleh controller dikirimkan ke view untuk ditampilkan.

3. # Proses Interaksi:
   - **View:** Menampilkan antarmuka grafis kepada pengguna dan mengirimkan permintaan data ke controller.
   - **Controller:** Menerima permintaan dari view, meneruskannya ke model, dan mengatur data untuk ditampilkan kembali di view.
   - **Model:** Menerima permintaan dari controller, mencari dan mengolah data, kemudian mengirimkannya kembali ke controller.

Dengan cara ini, "view" dan "controller" berinteraksi untuk memenuhi kebutuhan pengguna dalam menampilkan dan mengelola data, sementara "model" berperan dalam mencari, mengolah, dan menyediakan data yang diperlukan. Aliran data yang terorganisir ini membantu memisahkan tanggung jawab masing-masing komponen, meningkatkan struktur proyek, dan memudahkan pengembangan dan pemeliharaan aplikasi Hogwarts.

# Cara Menjalankan Aplikasi
1. Setelah menjalankan aplikasi, akan diarahkan ke halaman splash screen yang akan menampilkan "flash view" selama 5 detik sebelum beralih ke halaman utama (home) yang berisi menu 'Characters' dan 'Favorite'

2. 
3. 
