# 🚀 Supervision Cluster Proxmox - Hexaltech

Ce projet implémente une solution de monitoring robuste pour un cluster de production composé de **trois nœuds Lenovo M920q**.  
L'objectif est de garantir la **haute disponibilité** et la **sécurité thermique** de l'infrastructure.

---

## 🏗️ Architecture Matérielle

- **Nœuds** : 3x Lenovo M920q (Format *Tiny*)
- **Réseau** : Cartes Intel X520 10Gb SFP+ (Intégration directe)
- **OS** : Proxmox VE 8.3.0 (Basé sur Debian 12/13)

---

## 🛠️ Stack Logicielle (Dockerized)

Le déploiement repose sur une stack moderne et performante :

- **VictoriaMetrics** : Stockage long terme des données avec haute compression
- **Prometheus** : Moteur de collecte et de requêtage (PromQL)
- **Grafana** : Visualisation centralisée via dashboards dynamiques
- **Alertmanager** : Dispatching des alertes critiques vers les canaux de communication
- **Node Exporter & Blackbox Exporter** : Sondes système et vérification de la disponibilité réseau

---

## 🔍 Points de Contrôle Critiques

Le monitoring est focalisé sur trois indicateurs vitaux pour la santé du cluster :

---

### 1️⃣ 🌡️ Santé Thermique (CPU)

Surveillance des processeurs via la puce `coretemp`.  
Étant donné l'espace restreint (1L), la gestion de la chaleur est une priorité absolue.

- **Métrique surveillée** : `node_hwmon_temp_celsius`
- **Seuil d'alerte** : Notification Discord immédiate si la température dépasse **70°C**
- **Objectif** : Prévenir tout risque de throttling ou arrêt brutal

---

### 2️⃣ ⚡ État des Nœuds Proxmox

Vérification en temps réel de la disponibilité de chaque serveur du cluster.

- **Métrique surveillée** : `up`
- **Visualisation** :
  - PVE-01 → UP/DOWN
  - PVE-02 → UP/DOWN
  - PVE-03 → UP/DOWN

Objectif : Détection instantanée d’une panne d’un nœud.

---

### 3️⃣ 🌐 Connectivité 10Gb Ethernet

Surveillance spécifique des liens réseau 10Gb pour assurer la stabilité :

- Du stockage partagé (Ceph / réplication)
- Des migrations de machines virtuelles

- **Indicateur** : Statut du lien (Up/Down)
- **Interfaces surveillées** : SFP+ Intel X520

---

## 📊 Visualisation (Dashboard Master)

Le tableau de bord Grafana centralise :

- 🔥 **Bar Gauges** de température CPU (lecture instantanée)
- 📈 **Historique thermique** (Time Series)
- 🌐 **Statut des liens 10Gb**
- 🖥️ **Mode Kiosk** optimisé pour affichage permanent sur écran déporté (ex: Raspberry Pi)

---

# ⚙️ Installation Rapide

Cloner le projet :

```bash
git clone https://github.com/ton-compte/stack_hexaltech.git
cd stack_hexaltech
