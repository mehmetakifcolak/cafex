# Temel imaj olarak Python 3.8 kullan
FROM python:3.8

# Çalışma dizinini oluştur ve ayarla
WORKDIR /app

# Gereksinimlerinizi yüklemek için requirements.txt dosyasını kopyala
COPY requirements.txt .

# Python kütüphanelerini yükle
RUN pip install --no-cache-dir -r requirements.txt

# Proje dosyalarını kopyala
COPY . .

# Veritabanı migrasyonlarını uygulamak ve sunucuyu başlatmak için komutlar
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]