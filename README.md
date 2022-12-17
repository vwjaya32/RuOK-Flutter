![GitHubRelease](https://github.com/vwjaya32/RuOK-Flutter/actions/workflows/release.yml/badge.svg)  
![AppCenterRelease](https://github.com/vwjaya32/RuOK-Flutter/actions/workflows/app-center-release.yml/badge.svg)  

# Pemrograman Berbasis Platform 2022/2023

## Kelompok E-10 👨‍👨‍👦‍👦  
2106638614 - Felix Tjahyadi  
2106637776 - Vinsen Wijaya  
2106708324 - Marcelinus Gerardo  
2106633626 - Rafito Humam Abrar  
2106650001 - Thobyas Muda Parlindungan  
2106751184 - Balqis Asy-Syifa Lumbun  

- [Deskripsi](#ruok) 📱
- [Link](#link-aplikasi) 🌍
- [User](#user-role) 😎
- [Modul](#modul) 🎯
- [Alur Integrasi](#alur-integrasi) 🕊

<br>
<br>

# **RuOK** (*Are u OK?*)
Sebagai tindak lanjut dari usaha kami dalam membantu menyelesaikan masalah mental dunia, kami memutuskan untuk melakukan aplikasi _mobile_ sebagai bentuk perluasann akses menuju website **RuOK**. Aplikasi ini kurang lebih akan memiliki modul atau fitur yang sama dengan versi _website_-nya. 
<br>
<br>

### **Link Aplikasi**
👇👇👇👇👇👇👇<br>
[AppCenter release](https://install.appcenter.ms/orgs/ruok/apps/ruok/distribution_groups/public)  
[GitHub release](https://github.com/vwjaya32/RuOK-Flutter/releases)  
<br>
<br>

### **User Role**
_User Role_ pada RuOK _mobile_ memiliki kesamaan dengan _User Role_ yang berjalan di versi _website_.  
Perbedaannya, pada RuOK _mobile_ _user_ yang tidak _login_ akan menggunakan _dummy user_ bernama 'guest'.
Dengan demikian, dalam versi _mobile_, kata _User_ mengacu pada _user_ yang sudah _login_.

### **Modul**
Modul yang akan diimplementasikan dalam aplikasi _mobile_ yang akan kami buat.<br> 

**`Stories` - Rafito**  
Pada modul ini pengguna dapat membuat thread dan me-reply thread yang ada. Pengguna yang berpartisipasi dalam suatu story akan masuk dalam daftar peserta thread.<br>

**`Articles` - Gerardo**  
Secara umum, modul ini akan menampilkan artikel tentang kesehatan mental. Berikut ini adalah gambaran mengenai action yang dapat dilakukan pada Articles:
- Artikel hanya dapat dibuat dan dihapus oleh `admin`, namun dapat dibaca oleh siapapun
- Setiap `user` dapat memberikan komentar untuk sebuah komentar dengan *pseudonym*
- Setiap komentar yang telah di-*post* tidak dapat dapat dihapus, kecuali oleh `admin`<br>

**`Community Events` - Felix**  
Terdapat daftar event yang dapat diikuti oleh user. Sebuah acara hanya dapat dibuat oleh Admin, user yang sudah login dapat mendaftarkan diri pada acara tersebut.<br>

**`Mental Health Goods` - Thobyas**  
Modul ini akan menampilkan barang yang berhubungan dengan kesehatan mental untuk yang dijual di website ini.<br>

**`Mental Health Tests` - Balqis**  
Modul ini akan menampilkan pertanyaan singkat untuk menilai keadaan mental seseorang.<br>

**`Motivational Quotes` - Vinsen**  
Pada modul ini, pengguna dapat mengunggah gambar berisi kutipan motivasi yang dapat dilihat oleh user lain.<br>
<br>
<br>

### **Alur integrasi**
Kami akan melakukan integrasi menghubungkan isi JSON yang ada di proyek heroku dengan cara membuat model flutter yang serupa dengan model django. Kami akan mengambil data dari url json yang dimiliki heroku dan mengaktifkan dependency HTTP serta menampilkan data dengan widget FutureBuilder.

### **PATCH**
By Vinsen (2106637776):
1. General  
   a. Menambahkan fitur Logout (Termasuk mengonfigurasi ulang fitur Login)  
   b. Release App ke GitHub  
   c. Release App ke App Center  
   d. Update README (untuk badge dan keterangan role)  
   e. Menghapus file-file yang tidak terpakai  
2. Quotes  
   a. Dalam form pengunggahan, menambahkan fitur image preview  
   b. Dalam page untuk setiap quotes, menambahkan fitur delete  
   c. Mengimplementasikan authorization:  
      1) guest tidak bisa menghapus dan mengunggah gambar  
      2) User dapat menghapus gambar yang diunggah olehnya  
      3) admin dapat menghapus gambar yang telah diunggah oleh user  
   d. Update UI  
<br>

By Thobyas (2106650001)  
Pada Catalogue  
1. Buy button sudah berfungsi, akan keluar form pembelian.  
2. User yang ingin membeli di Catalogue harus login terlebih dahulu agar buy button berfungsi, jika belum login, hanya bisa melihat produk-produknya saja.  
<br>

By Balqis (2106751184):  
Pada Tests  
1. Perbaikan UI  
2. Page redirect ke result  
3. Perbedaan otorisasi untuk guest dan anggota biasa (anggota biasa bisa simpan)  
4. Mh save untuk metode post, fetch untuk get  
5. Pemunculan dialog untuk konfirmasi simpan.  
<br>

By Rafito Humam (2106633626)  
Pada Stories  
1. Penambahan fitur POST and GET dari Replies (balasan) terhadap setiap Stories.  
2. Diferesiansi autorisasi, guest tidak bisa melihat atau menekan tombol post Stories, hanya user yang terdaftar yang bisa.  
3. Refactor dari folder dan file.  
4. Perbaikan UI dengan menambahkan container dan warna yang meningkatkan readibility.  
