# Blutter GitHub Runner

Proyek ini membangun dan menjalankan `dedshit/blutter-termux` melalui Docker, GitHub Actions, atau Termux.

## GitHub Actions dengan APK Langsung

1. Buat repository GitHub baru.
2. Unggah seluruh isi proyek ini ke root repository.
3. Masuk ke folder `input` pada repository GitHub.
4. Tekan `Add file` lalu `Upload files`.
5. Unggah APK ke folder `input`, misalnya `input/app.apk`.
6. Buka tab `Actions`.
7. Pilih `Build and Run Blutter`.
8. Tekan `Run workflow`.
9. Kosongkan `apk_name` jika hanya ada satu APK, atau isi nama file seperti `app.apk`.
10. Setelah selesai, unduh artifact `blutter-output`.

GitHub membatasi upload file biasa melalui browser. APK berukuran lebih dari 25 MB sebaiknya di-push dengan Git, sedangkan file lebih dari 100 MB memerlukan Git LFS atau metode penyimpanan lain.

## Docker Lokal

```bash
chmod +x scripts/run-local.sh scripts/entrypoint.sh
./scripts/run-local.sh /path/aplikasi.apk ./output
```

## Termux

```bash
chmod +x scripts/setup-termux.sh
./scripts/setup-termux.sh
cd blutter-termux
python blutter.py /path/aplikasi.apk output
```

## Input yang Didukung

- APK Android Flutter
- Folder yang berisi `libapp.so` dan `libflutter.so`
- `libapp.so` dengan argumen versi Dart yang sesuai

## Catatan

Blutter pada repo sumber mendukung Android ARM64 dan memerlukan compiler modern serta library ICU, Capstone, dan fmt.
