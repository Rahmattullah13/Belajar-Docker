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

## Container Resource Limit

- Saat membuat container, secara default dia akan menggunakan semua CPU dan Memory yang diberikan ke DOcker (Mac dan Windows), dan akan menggunakan semua CPU dan Memory yang tersedia di sistem Host(Linux).
- Jika terjadi kesalahan, misal container terlalu banyak memakan CPU dan Memory, maka bisa berdampak terhadap performa container lain, atau bahkan ke sistem host.
- Oleh karena itu, ada baiknya ketika kita membuat container, kita memberikan resource limit terhadap container tersebut.

### Memory

- 

## Source

- [Programmer Zaman Now - Docker](https://www.youtube.com/watch?v=3_yxVjV88Zk&t=2271s)
