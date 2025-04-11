# 📊 ETF Аналитика с ClickHouse и Grafana

Этот проект собирает данные по ETF, сохраняет их в ClickHouse и отображает графики через Grafana.

---

## 🔧 Требования

- ClickHouse (сервер и клиент)
- Grafana

---

## 🚀 Установка ClickHouse

```bash
curl https://clickhouse.com/ | sh

Successfully downloaded the ClickHouse binary, you can run it as:
    ./clickhouse

You can also install it:
sudo ./clickhouse install

./clickhouse server

./clickhouse client

project/
├── etfs.sql               # SQL-файл для создания таблиц
├── README.md

Установи Grafana: https://grafana.com/grafana/download

Открой интерфейс: http://localhost:3000

Добавь источник данных:

Тип: ClickHouse

URL: http://localhost:8123

