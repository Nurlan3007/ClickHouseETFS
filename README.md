# ClickHouse: Установка и запуск скрипта

Этот гайд поможет установить ClickHouse, запустить сервер и выполнить ваш SQL- или Python-скрипт.

---

## 📦 Установка ClickHouse (Ubuntu / Debian)

```bash
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates dirmngr

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv E0C56BD4
echo "deb https://packages.clickhouse.com/deb stable main" | sudo tee /etc/apt/sources.list.d/clickhouse.list

sudo apt-get update
sudo apt-get install -y clickhouse-server clickhouse-client

sudo service clickhouse-server start

project/
├── etfs.sql         # SQL-файл с запросами
├── README.md             # Инструкция
