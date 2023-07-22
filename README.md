# Belajar Docker Pemula

---

## Pengenalan Container

### Virtual Machine

- Dalam dunia infrastructure, kita sudah terbiasa dengan namanya VM(Virtual Machine).
- Saat membuat sebuah VM, biasanya kita akan menginstall sistem operasi juga di VM-nya.
- Masalah ketika kita menggunakan VM adalah prosesnya yang lambat ketika pembuatan VM-nya, dan butuh waktu untuk boot sistem operasi di dalam VM tersebut ketika kita menjalankan VM atau me-restart VM tersebut.

![VM Diagram](/assets/vm_diagram.png)

### Container

- Berbeda dengan VM, Container sendiri berfokus pada sisi Aplikasi.
- Container sendiri sebenarnya berjalan diatas aplikasi Container Manager yang berjalan di sistem operasi.
- Yang membedakan dengan VM adalah, pada Container, kita bisa mem-package aplikasi dan dependency-nya tanpa harus menggabungkan sistem operasi.
- Container akan menggunakan sistem operasi host dimana Container Manager nya berjalan, oleh karena itu, Container akan lebih hemat resource dan lebih cepat jalannya. karena tidak butuh sistem operasi sendiri.
- Ukuran Container biasanya hanya hitungan MB, berbeda dengan VM yang bisa sampai GB karena di dalamnya ada sistem operasinya.

![VM Diagram](/assets/container_diagram.png)

---

## Pengenalan Docker

- Docker adalah salah satu implemetasi Container Manager yang saat ini paling populer.
- Docker merupakan teknolohi yang masih baru, karena baru diperkenalkan sekitar tahun 2013.
- Docker adalah aplikasi yang free dan Open Source, sehingga kita bisa gunakan secara bebas.
- [Website Resmi](https://www.docker.com/)

### Docker Architecture

- Docker menggunakan arsitektur Client-Server.
- Docker client berkomunikasi dengan Docker daemon(server)
- Saat kita menginstall Docker, biasanya didalamnya sudah terdapat Docker Client dan Docker Daemon.
- Docker Client dan Docker Daemon bisa berjalan di satu sistem yang sama.
- Docker Client dan Docker Daemon berkomunikasi dengan menggunakan REST-API.

![VM Diagram](/assets/docker-arch-diagram.png)

## Menginstall Docker

- Docker bisa di install di hampir semua sistem aplikasi.
- Untuk menginstall di Windows dan Mac, kita bisa menggunakan Docker Desktop.
- [Link Docker Desktop](https://docs.docker.com/get-docker/)
- Untuk Linux, kita bisa install dari repository sesuai dengan distro linux masing-masing.
- [Link Docker Linux](https://docs.docker.com/engine/install/)

### Mengecek Docker

- Untuk mengecek apakah Docker Daemon sudah berjalan, kita bisa gunakan perintah :

```bash
docker version
```

---

## Docker Registry

- Docker Registry adalah tempat kita menyimpan Docker Image.
- Dengan menggunakan Docker Registry, kita bisa menyimpan Image yang kita buat, dan bisa digunakan di Docker Daemon dimanapun selama bisa terkoneksi ke Docker Registry.

![VM Diagram](/assets/docker-arch-diagram.png)

**Contoh Docker Registry**

- Docker Hub : [link](https://hub.docker.com/)
- Digital Ocean Container Registry : [link](https://www.digitalocean.com/products/container-registry)
- Google Cloud Container Registry : [link](https://cloud.google.com/container-registry)
- Amazon Elastic Container Registry : [link](https://aws.amazon.com/id/ecr)
- Azure Container Registry : [link](https://azure.microsoft.com/en-us/services/container-registry)

---

## Docker Image

- Docker Image mirip dengan installer aplikasi, dimana di dalam Docker Image terdapat aplikasi dan dependency.
- Sebelum kita bisa menjalankan aplikasi di Docker, kita perlu memastikan memiliki Docker Image aplikasi tersebut.
- Untuk melihat Docker Image yang terdapat di dalam Docker Daemon, kita bisa menggunakan perintah :

```bash
docker image ls
```

### Download Docker Image

- Untuk download Docker Image dari Docker Registry, kita bisa gunakan perintah :

```bash
docker image pull namaImage:tag
```

- Kita bisa mencari Docker Image yang ingin kita download di [Docker Hub](https://hub.docker.com/)

### Menghapus Docker Image

- Jika kita tidak ingin menggunakan Docker Image yang sudah kita download, kita bisa gunakan perintah :

```bash
docker image rm namaImage:tag
```

---

## Docker Container

- Jika Docker Image itu seperti installer aplikasi, maka Docker Container itu mirip seperti aplikasi hasil installer-nya.
- Satu Docker Image bisa digunakan untuk membuat beberapa Container, asalkan nama Docker Container-nya berbeda.
- Jika kita sudah membuat Docker COntainer, maka Docker Image yang digunakan tidak bisa dihapus, hal ini dikarenakan sebenarnya Docker Container tidak meng-copy isi Docker Image, tapi hanya menggunakan isinya saja.

### Status Container

- Saat kita membuat container, secara default container tersebut tidak akan berjalan.
- Mirip seperti ketika kita menginstall aplikasi, jika tidak kita jalankan, maka aplikasi tersebut tidak akan berjalan, begitu juga dengan container.
- Oleh karena itu, setelah membuat container, kita perlu menjalankannya jika memang ingin menjalankan container-nya.

### Melihat Container

- Untuk melihat semua container, baik yang sedang berjalan atau tidak di Docker Daemon, kita bisa gunakan perintah :

```bash
docker container ls -a
```

- Sedangkan jika kita ingin melihat container yang sedang berjalan saja, kita bisa gunakan perintah :

```bash
docker container ls
```

### Membuat Container

- Untuk membuat container, kita bisa gunakan perintah :

```bash
docker container create --name namaContainer namaImage:tag
```

### Menjalankan Container

- Untuk menjalankan container yang sudah kita buat, kita bisa gunakan perintah :

```bash
docker container start containerId/namacontainer
```

### Menghentikan Container

- Untuk menghentikan container, kita bisa gunakan perintah :

```bash
docker container stop containerId/namacontainer
```

### Menghapus Container

- Untuk menghapus container yang sudah berhenti, kita bisa gunakan perintah :

```bash
docker container rm containerId/namacontainer
```

---

## Container Log

- Kadang saat terjadi masalah dengan aplikasi yang terdapat di container, sering kali kita ingin melihat detail dari log aplikasinya.
- Hal ini dilakukan untuk melihat detail kejadian apa yang terjadi di aplikasi, sehingga akan memudahkan kita ketika mendapatkan masalah.

### Melihat Container Log

- Untuk melihat log aplikasi di container kita, kita bisa menggunakan perintah :

```bash
docker container logs containerId/namacontainer
```

- Atau jika ingin melihat log secara realtime, kita bisa gunakan perintah :

```bash
docker container logs -f containerId/namacontainer
```

---

## Docker Exec

- Saat kita membuat container, aplikasi yang terdapat di dalam container hanya bisa diakses dari dalam container.
- Oleh karena itu, kadang kita perlu masuk ke dalam container nya itu sendiri.
- Untuk masuk ke dalam container, kita bisa menggunakan fitur Container Exec, dimana digunakan untuk mengeksekusi kode program yang terdapat di dalam container.

### Masuk ke Container

- Untuk masuk ke dalam container, kita bisa mencoba mengeksekusi program bash script yang terdapat di dalam container dengan bantuan Container Exec :

```bash
docker container exec -i -t containerId/namacontainer /bin/bash
```

atau

```bash
docker container exec -i -t containerId/namacontainer /bin/sh
```

atau

```bash
docker container exec -i -t containerId/namacontainer //bin/sh
```

- -i adalah argument interaktif, menjaga input tetap aktif.
- -t adalah argument untuk alokasi pseudo-TTY(terminal akses)
- Dan /bin/bash adalah contoh kode program yang terdapat di dalam container.

---

## Container Port

- Saat menjalankan container, container tersebut terisolasi di dalam Docker.
- Artinya sistem Host(misal laptop kita), tidak bisa mengakses aplikasi yang ada di dalam container secara langsung, salah satu caranya adalah harus menggunakan Container Exec untuk masuk ke dalam container-nya.
- Biasanya, sebuah aplikasi berjalan pada port tertentu, misal saat kita menjalankan aplikasi Redis, dia berjalan pada port 6379, kita bisa melihat port apa yang digunakan ketika melihat semua daftar container.

### Port Forwarding

- Docker memiliki kemampuan untuk melakukan port forwarding, yaitu meneruskan sebuah port yang terdapat di sistem Host-nya ke dalam Docker Container.
- Cara ini cocok jiksa kita ingin mengekspos port yang terdapat di container ke luar melalui sistem Host-nya.

#### Melakukan Port Forwarding

- Untuk melakukan Port Forwading, kita bisa menggunakan perintah berikut ketika membuat container-nya:

```bash
docker container create --name namacontainer --publish posthost:portcontainer image:tag
```

- Jika kita ingin melakukan port forwarding lebih dari satu, kita bisa tambahkan dua kali parameter : **--publish**
- --publish juga bisa disingkat menggunakan -p

---

## Container Environment Variable

- Saat membuat aplikasi, menggunakan Environment Variable adalah salah satu teknik agar konfigurasi aplikasi bida diubah secara dinamis.
- Dengan menggunakan environment variable, kita bisa mengubah-ubah konfigurasi aplikasi, tanpa harus mengubah kode aplikasinya lagi.
- Docker Container memiliki parameter yang bisa kita gunakan untuk mengirim environment variable ke aplikasi yang terdapat di dalam container.

### Menambahkan Environment Variable

- Untuk menambahkan environment variable, kita bisa menggunakan perintah --env atau -e, misal :

```bash
docker container create --name namacontainer --env KEY="value" --env KEY="value" image:tag

contoh :

docker container create --name contohmongo --publish 27017:27017 --env MONGO_INITDB_ROOT_USERNAME=eko --env MONGO_INITDB_ROOT_PASSWORD=eko mongo:latest
```

---

## Container Stats

- Saat menjalankan beberapa container, di sistem Host, penggunaan resource seperti CPU dan Memory hanya terlihat digunakan oleh Docker saja.
- Kadang kita ingin melihat detail dari penggunaan resource untuk tiap container-nya.
- Untungnya docker memiliki kemampuan untuk melihat penggunaan resource dari tiap container yang sedang berjalan.
- Kita bisa gunakan perintah :

```bash
docker container stats
```

contoh :

![Container Stats](/assets/container-stats.png)

---

## Container Resource Limit

- Saat membuat container, secara default dia akan menggunakan semua CPU dan Memory yang diberikan ke DOcker (Mac dan Windows), dan akan menggunakan semua CPU dan Memory yang tersedia di sistem Host(Linux).
- Jika terjadi kesalahan, misal container terlalu banyak memakan CPU dan Memory, maka bisa berdampak terhadap performa container lain, atau bahkan ke sistem host.
- Oleh karena itu, ada baiknya ketika kita membuat container, kita memberikan resource limit terhadap container tersebut.

### Memory

- Saat membuat container, kita bisa menentukan jumlah memory yang bisa digunakan oleh container ini, dengan menggunakan perintah --memory diikuti dengan angka memory yang diperbolehkan untuk digunakan.
- Kita bisa menambahkan ukuran dalam bentuk b (bytes), k (kilo bytes), m (mega bytes), atau g (giga bytes), misalnya 100m artinya 100 mega bytes.

### CPU

- Selain mengatur Memory, kita juga bisa menentukan berapa jumlah CPU yang bisa digunakan oleh container dengan parameter --cpus.
- Jika kita set dengan nilai 1.5 artinya container bisa menggunakan satu dan setengah CPU core.

**Contoh**

```bash
docker container create --name smallnginx --publish 8081:80 --memory 100m --cpus 0.5 nginx:latest
```

---

## Bind Mounts

- Bind Mounts merupakan kemampuan melakukan mounting(sharing) file atau folder yang terdapat di sistem host ke container yang terdapat di docker.
- Fitur ini sangat berguna ketika misal kita ingin mengirimkan konfigurasi dari luar container, atau misal menyimpan data yang dibuat di aplikasi di dalam container ke dalam folder di sistem host.
- Jika file atau folder tidak ada di sistem host, secara otomatis akan dibuat oleh Docker.
- Untuk melakukan mounting, kita bisa menggunakan parameter --mount ketika membuat container.
- Isi dari parameter --mounting memiliki aturan tersendiri.

| Parameter   | Keterangan                                                                         |
| :---------- | :--------------------------------------------------------------------------------- |
| type        | Tipe mount, bind atau volume                                                       |
| source      | Lokasi file atau folder di sistem host                                             |
| destination | Lokasi file atau folder di container                                               |
| readonly    | Jika ada, maka file atau folder hanya bisa dibaca di container, tidak bisa ditulis |

## Melakukan Mounting

- Untuk melakukan mounting, kita bisa menggunakan perintah berikut :

```bash
docker container create --name namacontainer --mount "type=bind, source=folder, destination=folder, readonly" image:tag
```

---

## Docker Volume

- Fitur Bind Mounts sudah ada sejak Docker versi awal, di versi terbaru direkomendasikan menggunakan Docker Volume.
- Docker Volume mirip dengan Bind Mounts, bedanya adalah terdapat menagement Volume, dimana kita bisa menggunakan Volume, melihat daftar Volume, dan menghapus Volume.
- Volume sendiri bisa dianggap storage yang digunakan untuk menyimpan data, bedanya dengan Bind Mounts, pada bind mounts, data disimpan pada sistem host, sedangkan pada volume data di manage oleh Docker

### Melihat Docker Volume

- Saat kita membuat container, dimanakah data di dalam container itu disimpan, secara default semua data container disimpan di dalam volume.
- Jika kita coba melihat docker volume, kita akan lihat bahwa ada banyak volume yang sudah terbuat, walaupun kita belum pernah membuatnya sama sekali.
- Kita bisa gunakan perintah berikut untuk melihat daftar volume :

```bash
docker volume ls
```

### Membuat Volume

- Untuk membuat volume, kita bisa gunakan perintah :

```bash
docker volume create namavolume
```

### Menghapus Volume

- Volume yang tidak digunakan oleh container bisa kita hapus, tapi jika volume digunakan oleh container, maka tidak bisa kita hapus sampai container nya di hapus terlebih dahulu.
- Untuk menghapus volume, kita bisa gunakan perintah :

```bash
docker volume rm namavolume
```

---

## Container Volume

- Volume yang sudah kita buat, bisa kita gunakan di container.
- Keuntungan menggunakan volume adalah, jika container kita hapus data akan tetap aman di volume.
- Cara menggunakan volume di container sama dengan menggunakan bind mounts, kita bisa menggunakan parameter **--mount**, namun dengan menggunakan **type volume** dan **source name volume**.

**Contoh**

```bash
docker container create --name mongovolume --publish 27019:27017 --mount "type=volume,source=mongodata,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=username --env MONGO_INITDB_ROOT_PASSWORD=password mongo:latest
```

**Jika gagal terus, bisa menggunakan Docker Compose seperti ini**

1. Buat file bernama docker-compose.yml di dalam direktori proyek Anda, dan masukkan konfigurasi berikut ke dalam file tersebut:

```yml
version: '3'
services:
  mongo:
    image: mongo:latest
    container_name: mongovolume
    ports:
      - '27019:27017'
    volumes:
      - mongodata:/data/db
    environment:
      - MONGO_INITDB_ROOT_USERNAME=rifki
      - MONGO_INITDB_ROOT_PASSWORD=rifki

volumes:
  mongodata:
```

2. Jalankan perintah berikut untuk memulai container:

```bash
docker-compose up -d
```

---

## Backup Volume

- Sayangnya, sampai saat ini, tidak aada cara otomatis untuk melakukan backup volume yang sudah kita buat.
- Namun kita bisa memanfaatkan container untuk melakukan backup data yang ada di dalam volume ke dalam archive seperti zip atau tar.gz.

### Tahapan Melakukan Backup

- Matikan container yang menggunakan volume yang ingin kita backup.
- Buat container baru dengan dua mount, volume yang ingin kita backup, dan bind mount folder dari sistem host.
- Lakukan backup menggunakan container dengan cara meng-archive isi volume, dan simpan di bind mount folder.
- Isi file backup sekarang ada di folder sistem host.
- Delete container yang kita gunakan untuk melakukan backup.

### Menjalankan Container Secara Langsung

- Melakukan backup secara manual agak sedikit ribet karena kita harus start container terlebih dahulu, setelah backup, hapus container nya lagi.
- Kita bisa menggunakan perintah **run** untuk menjalankan perintah di container dan gunakan parameter --rm untuk melakukan otomatis remove container setelah perintahnya selesai berjalan.

**Contoh**

```bash
docker container run --rm --name ubuntubackup --mount "type=bind,source=/Users/khannedy/Developments/YOUTUBE/belajar-docker-dasar/backup,destination=/backup" --mount "type=volume,source=mongodata,destination=/data" ubuntu:latest tar cvf /backup/backup-lagi.tar.gz /data
```

---

## Restore Volume

- Setelah melakukan backup volume ke dalam file archive, kita bisa menyimpan file archive backup tersebut ke tempat yang lebih aman, misal ke cloud storage.
- Sekarang kita akan coba melakukan restore data backup ke volume baru, untuk memastikan data backup yang kita lakukan tidak corrupt.

### Tahapan Melakukan Restore

- Buat volume baru untuk lokasi restore data backup.
- Buat container baru dengan dua mount, volume baru untuk restore backup, dan bind mount folder dari sistem host yang berisi file backup.
- Lakukan restore menggunakan container dengan cara meng-extract isi backup file ke dalam volume.
- Isi file backup sekarang sudah di restore ke volume.
- Delete container yang kita gunakan untuk melakukan restore.
- Volume baru yang berisi data backup siap digunakan oleh container baru.

---

## Docker Network

- Saat kita membuat container di docker, secara default container akan saling terisolasi satu sama lain, jadi jika kita mencoba memanggil antar container, bisa dipastikan bahwa kita tidak bisa melakukannya.
- Docker memiliki fitur Network yang bisa digunakan untuk membuat jaringan di dalam Docker.
- Dengan menggunakan Network, kita bisa mengkoneksikan container dengan container lain dalam satu Network yang sama.
- Jika beberapa container terdapat pada satu Network yang sama, maka secara otomatis container tersebut bisa saling berkomunkasi.

### Network Driver

- Saat kita membuat Network di Docker, kita perlu menentukan driver yang ingin kita gunakan, ada banyak driver yang bisa kita gunakan, tapi kadang ada syarat sebuah driver network bisa kita gunakan.
- bridge, yaitu driver yang digunakan untuk membuat network secara virtual yang memungkinkan container yang terkoneksi di bridge network yang sama saling berkomunikasi.
- host, yaitu driver yang digunakan untuk membuat network yang sama dengan sistem host. host hanya jalan di Docker Linux, tidak bisa digunakan di MAC atau Windows.
- none, yaitu driver untuk membuat network yang tidak bisa berkomunikasi.

### Melihat Network

- Untuk melihat network di Docker, kita bisa gunakan perintah:

```bash
docker network ls
```

### Membuat Network

- Untuk membuat network baru, kita bisa menggunakan perintah:

```bash
docker network create --driver namadriver namanetwork
```

### Menghapus Network

- Untuk menghapus Network, kita bisa gunakan perintah:

```bash
docker network rm namanetwork
```

- Network tidak bisa dihapus jika sudah digunakan oleh container. Kita harus menghapus containernya terlebih dahulu dari Network.

---

## Container Network

- Setelah kita membuat Network, kita bisa menambahkan container ke network.
- Container yang terdapat di dalam network yang sama bisa saling berkomunikasi(tergantung jenis driver network nya).
- Container bisa mengakses container lain dengan menyebutkan hostname dari container nya, yaitu nama container nya.

### Membuat Container dengan Network

- Untuk menambahkan container ke network, kita bisa menambahkan perintah --network ketika membuat container, misal :

```bash
docker container create --name namacontainer --network namanetwork image:tag
```

### Menghapus Container dari Network

- Jika diperlukan, kita juga bisa menghapus container dari network dengan perintah :

```bash
docker network disconnect namanetwork namacontainer
```

---

## Inspect

- Setelah kita men-download image, atau membuat network, volume dan container. Kadang kita ingin melihat detail dari tiap hal tersebut.
- Misal kita ingin melihat detail dari image, perintah apa yang digunakan oleh image tersebut? Environment variable apa yang digunakan? Atau port apa yang digunakan?
- Misal kita juga ingin melihat detail dari container, Volume apa yang digunakan? Environment variable apa yang digunakan? Port forwarding apa yang digunakan? dan lain-lain.
- Docker memiliki fitur bernama inspect, yang bisa digunakan di image, container, volume dan network.
- Dengan fitur ini, kita bisa melihat detail dari tiap hal yang ada di Docker.

### Menggunakan Inspect

- Untuk melihat detail dari image, gunakan :

```bash
docker image inspect namaimage
```

- Untuk melihat detail dari container, gunakan :

```bash
docker container inspect namacontainer
```

- Untuk melihat detail dari volume, gunakan :

```bash
docker volume inspect namavolume
```

- Untuk melihat detail dari network, gunakan :

```bash
docker network inspect namanetwork
```

---

## Prune

- Saat kita menggunakan Docker, kadang ada kalanya kita ingin membersihkan hal-hal yang sudah tidak digunakan lagi di Docker, misal container yang sudah di stop, image yang tidak digunakan oleh container, atau volume yang tidak digunakan oleh container.
- Fitur untuk membersihkan secara otomatis di Docker bernama prune.
- Hampir di semua perintah di Docker mendukung prune.

### Perintah Prune

- Untuk menghapus semua container yang sudah stop, gunakan :

```bash
docker container prune
```

- Untuk menghapus semua image yang tidak digunakan container, gunakan :

```bash
docker image prune
```

- Untuk menghapus semua network yang tidak digunakan container, gunakan :

```bash
docker network prune
```

- Untuk menghapus semua volume yang tidak digunakan container, gunakan :

```bash
docker volume prune
```

- Atau kita bisa menggunakan satu perintah untuk menghapus container, network dan image yang sudah tidak digunakan menggunakan perintah :

```bash
docker system prune
```

## Source

- [Programmer Zaman Now - Docker](https://www.youtube.com/watch?v=3_yxVjV88Zk&t=2271s)
