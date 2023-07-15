# Belajar Docker Pemula

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

## Pengenalan Docker

- Docker adalah salah satu implemetasi Container Manager yang saat ini paling populer.
- Docker merupakan teknolohi yang masih baru, karena baru diperkenalkan sekitar tahun 2013.
- Docker adalah aplikasi yang free dan Open Source, sehingga kita bisa gunakan secara bebas.
- [Website Resmi](https://www.docker.com/)

### Docker Architecture

- Docker menggunakan arsitektur CLient-Server.
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

## Source

- [Programmer Zaman Now - Docker](https://www.youtube.com/watch?v=3_yxVjV88Zk&t=2271s)