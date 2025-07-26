# Dev No Kage - Project Initializer

## ✨ Un Starter Kit PHP Moderne
Un boilerplate élégant et flexible, conçu pour démarrer rapidement vos projets PHP. Il allie une architecture modulaire inspirée du DDD à une structure MVC minimaliste, avec une injection de dépendances simple via YAML et tous les composants essentiels pour construire une application propre et maintenable.

🚀 Fonctionnalités clés
🔧 Architecture hybride :
Utilisez soit une structure MVC classique dans app/, soit une architecture modulaire évolutive dans src/ avec Controller, Service, Repository, etc.

🧠 Parfait pour évoluer d’un petit projet vers une application robuste.

## ⚙️ Injection de dépendances déclarative :
Définissez vos services dans un simple fichier YAML :
app/config/services.yaml.

## 🔐 Chargement de configuration via DotEnv :
Centralisez vos variables sensibles dans .env, avec gestion automatique via vlucas/phpdotenv.

## 🧩 Autoloading PSR-4 :
Conforme à la norme PSR-4 grâce à Composer pour une organisation claire du code.

## 🗂️ Structure propre et flexible :

app/ : pour un démarrage rapide en MVC minimaliste

src/ : pour un découpage DDD ou hexagonal orienté métiers

core/ : noyau du système (injection, routing, configuration)

## 📁 Structure du projet

project-root/

├── app/

│ ├── config/ # fichiers YAML, .env, helpers

│ └── core/ # cœur du framework

│   ├── abstract/ # Les classes abstract reutilisable

│   ├── enums/ # Les enumerations pour les clé du routeur et classes du fichier services.yml

│ └── interface/ # les interface pour les contracts de methodes 

├── public/ # point d'entrée (index.php)

├── src/ # la ou sera vos entity, controller, repository

├── composer.json

└── README.md


---

⚙️ Installation
1. Cloner le dépôt (optionnel si vous utilisez create-project)

git clone https://github.com/gorguimarena/project-initializer.git
cd project-initializer


2. Créer un nouveau projet depuis le package Packagist

composer create-project dev-no-kage/project-initializer nom-du-projet
cd nom-du-projet

3. Installer les dépendances

composer install

4. Configurer les variables d'environnement

cp app/config/.env.example .env
  🛠️ Modifiez le fichier .env selon votre configuration locale (base de données, port, etc.).

5. Démarrer un serveur local
    php -S localhost:8000 -t public

🧠 Comment ça marche ?
🔁 Injection de dépendances
Le projet repose sur un conteneur de services défini dans app/config/services.yaml, où chaque classe peut déclarer ses dépendances à injecter automatiquement.

Exemple de définition :

MaClasse:
  class: App\Service\MaClasse
  argument:
    - App\Repository\AutreClasse

⚙️ Moteur d’injection interne
Le système d’injection de dépendances est basé sur deux éléments principaux :

1. services.yaml
Le fichier central de déclaration des services :

Chaque entrée correspond à un service unique

Les dépendances sont injectées automatiquement par le moteur


✅ Ce système permet de découpler le code métier de la logique de création des objets, favorisant la maintenabilité et les tests.

🧱 Structure d’un service


CLE_UNIQUE:
  class: Namespace\De\La\Classe
  argument: [Liste, Des, Dépendances]

CLE_UNIQUE : identifiant du service (doit exister dans l’énum ClassName de app/core)
class : nom complet de la classe avec son namespace
argument : liste des arguments nécessaires au constructeur

2. Syntaxe des arguments dans argument
Les arguments peuvent être de différents types :

| Type                      | Syntaxe YAML          | Interprétation                        |
| ------------------------- | --------------------- | ------------------------------------- |
| Service (classe)          | `- "@NOM_DU_SERVICE"` | Injection d’une autre classe déclarée |
| Variable d’environnement  | `- "%NOM_DE_LA_VAR%"` | declaré comme constance dans env.php |
| Valeur simple (texte/num) | `- "valeur"`          | Transmise telle quelle                |


🔁 Exemples pratiques
✅ Injection sans dépendance

DATABASE:

  class: DevNoKage\Core\Database

  argument: []

✅ Injection d’un service

AUTH:

  class: DevNoKage\Core\ClassAuth

  argument:

    - "@DATABASE"


✅ Injection de valeurs littérales

DATABASE:

  class: DevNoKage\Core\Database

  argument:

    - "driver"

    - "localhost"

    - "5432"

    - "dbname"



✅ Injection de variables d’environnement

DATABASE:

  class: DevNoKage\Core\Database
  
  argument:

    - "%DB_DRIVER%"

    - "%DB_HOST%"

    - "%DB_PORT%"

    - "%DB_NAME%"

📂 Fichier concerné : services.yml
Déclare toutes tes classes et dépendances dans app/config/services.yml.