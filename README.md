# 📊 ETF Аналитика с ClickHouse и Grafana

Этот проект собирает данные по ETF, сохраняет их в ClickHouse и отображает графики через Grafana.

---

## 🔧 Требования

- ClickHouse (сервер и клиент)
- Grafana

---

## 🚀 Установка ClickHouse

```bash
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates dirmngr

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv E0C56BD4
echo "deb https://packages.clickhouse.com/deb stable main" | sudo tee /etc/apt/sources.list.d/clickhouse.list

sudo apt-get update
sudo apt-get install -y clickhouse-server clickhouse-client
sudo service clickhouse-server start

project/
├── etfs.sql               # SQL-файл для создания таблиц
├── README.md

Установи Grafana: https://grafana.com/grafana/download

Открой интерфейс: http://localhost:3000

Добавь источник данных:

Тип: ClickHouse

URL: http://localhost:8123

