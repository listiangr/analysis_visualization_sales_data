# 🛒 **Product Sales Data Analysis**

## 📄 **Background**

Penjualan produk adalah salah satu aspek yang sangat penting dalam bisnis, karena mempengaruhi keputusan perusahaan dalam mengelola inventaris, strategi harga, dan pemasaran. Data penjualan yang akurat membantu perusahaan untuk merencanakan strategi bisnis yang lebih baik, serta memantau performa produk secara real-time. Dataset ini mengandung informasi mengenai berbagai produk, termasuk harga, permintaan, keuntungan, dan margin profit yang dapat dianalisis untuk mendapatkan wawasan yang lebih dalam tentang pasar dan kinerja produk.

## 🎯 **Objectives**

Tujuan dari analisis dataset ini adalah untuk:

1. Memahami tren penjualan produk di berbagai kategori.
2. Menganalisis profitabilitas setiap produk dan hubungannya dengan harga jual dan permintaan.
3. Menyediakan rekomendasi berdasarkan analisis profitabilitas dan tren permintaan untuk pengambilan keputusan bisnis yang lebih baik.

## 📊 **Data Overview**

Dataset ini berisi informasi tentang produk dari berbagai kategori, seperti produk kebersihan dan makanan kemasan. Setiap baris dalam dataset mewakili satu produk dengan berbagai atribut seperti nama produk, kategori, harga pokok, harga jual, dan jumlah permintaan yang tercatat.

### Struktur Data

| **Kolom**            | **Deskripsi**                                      |
|----------------------|----------------------------------------------------|
| `UNIQUE_ID`          | ID unik untuk setiap produk                        |
| `PRODUCT_NAME`       | Nama produk                                        |
| `COMPANY`            | Kode perusahaan                                    |
| `PRODUCT_TYPE`       | Jenis produk (misalnya: hygiene, beauty products)  |
| `PRODUCT_CATEGORY`   | Kategori produk (misalnya: oral care, bodycare)    |
| `COST_PRICE`         | Harga pokok penjualan (dalam satuan mata uang)     |
| `SELLING_PRICE`      | Harga jual (dalam satuan mata uang)                |
| `QUANTITY_DEMANDED`  | Jumlah permintaan untuk produk tersebut           |
| `PROFIT`             | Keuntungan per unit                                |
| `PROFIT_PERCENT`     | Persentase keuntungan dari harga pokok            |
| `NET_PROFIT`         | Keuntungan bersih (dihitung dari `PROFIT` × `QUANTITY_DEMANDED`) |

### Contoh Data

| UNIQUE_ID | PRODUCT_NAME                     | COMPANY | PRODUCT_TYPE      | PRODUCT_CATEGORY | COST_PRICE | SELLING_PRICE | QUANTITY_DEMANDED | PROFIT  | PROFIT_PERCENT | NET_PROFIT  |
|-----------|----------------------------------|---------|------------------|-----------------|------------|---------------|------------------|---------|----------------|-------------|
| 99        | B Toothpaste, 100g              | B       | hygiene          | oral care       | 117.80     | 155.00        | 333              | 37.20   | 31.57895       | 12387.60    |
| 98        | I strawberry flavour Oats, 1kg  | I       | Packed Food      | Dry Fruits      | 365.00     | 419.75        | 308              | 54.75   | 15.00000       | 16863.00    |
| 97        | B Toothbrush                    | B       | hygiene          | oral care       | 180.12     | 237.00        | 342              | 56.88   | 31.57895       | 19452.96    |

## ❓ **Business Question**

Beberapa pertanyaan bisnis yang dapat dijawab melalui analisis dataset ini adalah:

1. **Produk mana yang memiliki margin keuntungan tertinggi dan terendah?**
2. **Bagaimana hubungan antara harga jual dan permintaan produk?**
3. **Apakah ada pola yang mengindikasikan produk yang lebih banyak diminati dalam kategori tertentu?**
4. **Produk mana yang memberikan keuntungan bersih tertinggi berdasarkan permintaan yang tercatat?**

## 🔬 **Methodology**

Untuk menganalisis dataset ini, langkah-langkah berikut dapat dilakukan:

1. **Data Preprocessing**:
   - Menangani nilai yang hilang dan memastikan kualitas data.
   - Menghitung kolom tambahan seperti keuntungan bersih (`NET_PROFIT`) dan margin keuntungan (`PROFIT_PERCENT`).

2. **Exploratory Data Analysis (EDA)**:
   - Visualisasi distribusi harga pokok dan harga jual.
   - Analisis hubungan antara permintaan dan keuntungan.
   - Pencarian pola kategori produk dan jenis produk terkait.

3. **Statistical Analysis**:
   - Analisis korelasi antara variabel harga jual dan permintaan.
   - Uji hipotesis untuk menguji keberlanjutan tren yang ditemukan.

4. **Recommendation Engine**:
   - Berdasarkan analisis profitabilitas dan tren permintaan, rekomendasikan produk mana yang perlu dipromosikan atau diberi penawaran khusus.

## 📈 **Insight**

Beberapa wawasan yang dapat ditemukan dari dataset ini antara lain:

- **Produk dengan margin keuntungan tertinggi**: Produk yang memiliki perbedaan harga jual dan harga pokok yang besar cenderung memiliki profit margin yang tinggi.
- **Tren permintaan**: Beberapa produk dengan permintaan tinggi memiliki hubungan negatif dengan harga jual, sedangkan yang lain menunjukkan bahwa penurunan harga dapat meningkatkan permintaan.
- **Kategori produk yang mendominasi**: Kategori seperti hygiene atau produk perawatan tubuh cenderung lebih stabil dalam permintaan.

## 💡 **Recommendation**

Berdasarkan analisis ini, berikut adalah beberapa rekomendasi bisnis:

1. **Penyesuaian Harga**: Untuk produk dengan permintaan tinggi namun profit margin rendah, perusahaan dapat mempertimbangkan untuk menurunkan harga sedikit demi meningkatkan volume penjualan.
2. **Promosi Produk dengan Profit Terendah**: Untuk meningkatkan penjualan produk dengan profit margin rendah, perusahaan bisa menawarkan diskon atau bundling dengan produk lain yang lebih menguntungkan.
3. **Investasi dalam Kategori Populer**: Fokus pada kategori produk yang menunjukkan permintaan stabil dan margin keuntungan yang lebih tinggi.

## 📌 **Conclusion**

Analisis dataset ini memberikan gambaran yang jelas tentang hubungan antara harga, permintaan, dan keuntungan produk. Dengan wawasan ini, perusahaan dapat mengambil langkah strategis yang lebih terinformasi dalam meningkatkan keuntungan dan merancang promosi yang efektif.
