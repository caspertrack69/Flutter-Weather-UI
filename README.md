# Flutter Weather UI

Aplikasi cuaca Flutter ini menyediakan antarmuka pengguna yang menarik untuk menampilkan informasi cuaca terkini dan perkiraan. Aplikasi ini menggunakan data cuaca statis dan menyediakan fitur seperti radar cuaca, grafik suhu dan kelembapan, serta berbagai elemen UI menarik.

## Fitur

- **Tampilan Cuaca:** Menampilkan informasi cuaca terkini dengan grafik suhu dan kelembapan.
- **Radar Peta:** Menyediakan peta dengan tampilan radar cuaca.
- **Tooltip & Info Popup:** Menyediakan informasi tambahan melalui tooltip dan popup.
- **Fitur Pencarian Lokasi:** Memungkinkan pengguna mencari lokasi dan melihat informasi cuaca.
- **Tampilan Loading Shimmer:** Menampilkan efek shimmer saat data sedang dimuat.

## Prasyarat

- Flutter 3.0 atau lebih baru
- Android Studio atau VSCode
- Kunci API Google Maps (jika menggunakan peta radar)

## Instalasi

1. **Kloning repositori:**

    ```bash
    git clone https://github.com/username/flutter_weather_ui.git
    cd flutter_weather_ui
    ```

2. **Install dependensi:**

    ```bash
    flutter pub get
    ```

3. **Konfigurasi API:**

   - Jika menggunakan Google Maps, tambahkan kunci API Google Maps Anda ke file `android/app/src/main/AndroidManifest.xml`:

    ```xml
    <meta-data
        android:name="com.google.android.geo.API_KEY"
        android:value="YOUR_API_KEY"/>
    ```

4. **Jalankan aplikasi:**

    ```bash
    flutter run
    ```

## Struktur Proyek

- `lib/` - Berisi semua kode sumber Flutter.
  - `main.dart` - Titik masuk aplikasi.
  - `ui/` - Berisi berbagai layar aplikasi.
  - `presenter/` - Komponen UI yang digunakan di seluruh aplikasi.
  - `data/` - Model data yang digunakan dalam aplikasi.
  - `utils/` - Utilitas tambahan seperti helper dan layanan.

## Kontribusi

Jika Anda ingin berkontribusi pada proyek ini, silakan lakukan fork repositori ini dan buat pull request. Pastikan untuk mengikuti pedoman pengkodean dan menulis pengujian untuk fitur baru.

## Lisensi

Proyek ini dilisensikan di bawah [MIT License](LICENSE).

## Kontak

Jika Anda memiliki pertanyaan, silakan hubungi [nama Anda](mailto:email@example.com).
