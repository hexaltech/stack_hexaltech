# 🚀 Supervision Cluster Proxmox - Hexaltech

Ce projet met en place une stack de monitoring complète pour un cluster de 3 nœuds **Lenovo M920q** (Tiny PC). 

## 🏗️ Architecture Matérielle
* **Nœuds** : 3x Lenovo M920q (Format 1 litre)
* **Réseau** : Cartes Intel X520 10Gb SFP+ (via Riser)
* **OS** : Proxmox VE (Debian)

## 🛠️ Stack Logicielle
* **VictoriaMetrics** : Base de données de séries temporelles (TSDB) performante.
* **Prometheus Node Exporter** : Collecte des métriques système (CPU, RAM, Température).
* **Grafana** : Visualisation des données via des dashboards interactifs.
* **Alertmanager** : Gestion des notifications critiques.

## 🌡️ Monitoring de la Température
Étant donné la compacité des boîtiers (1L) et la chaleur dégagée par les cartes 10Gb, une surveillance thermique étroite est configurée :
* **Sonde** : `node_hwmon_temp_celsius` (Puce `coretemp`)
* **Alerte** : Notification **Discord** automatique si la température dépasse **70°C**.

## 📊 Dashboards Grafana
Le dashboard inclut :
* Visualisation en temps réel de la température par nœud (PVE-01, PVE-02, PVE-03).
* État de disponibilité des nœuds (Metric `up`).
* Historique des pics de chaleur.
