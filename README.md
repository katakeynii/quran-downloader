# Quran MP3 Downloader

## Description
Un outil en ligne de commande Ruby permettant de télécharger les 114 sourates du Coran en format MP3 depuis une source spécifiée. L'application organise automatiquement les fichiers par récitateur dans des dossiers dédiés.

## Prérequis
- Ruby (version recommandée : 2.7+)
- Bundler

## Installation

## Structure du Projet
- `bin/run` : Script principal pour l'exécution du programme
- `lib/quran_downloader.rb` : Code source principal pour le téléchargement du Coran
- `downloads/` : Dossier où les fichiers MP3 seront téléchargés

## Utilisation
L'outil s'utilise en ligne de commande avec les options suivantes :

```bash
./bin/run -r [nom_recitateur] -u [url_base]
```

Options disponibles :
- `-r, --reciter` : Nom du récitateur (créera un sous-dossier avec ce nom)
- `-u, --url` : URL de base où se trouvent les fichiers MP3
- `-h, --help` : Affiche l'aide

Exemple :
```bash
./bin/run -r "Mishary-Rashid-Alafasy" -u "http://example.com/quran/mp3"
```

## Fonctionnalités
- Téléchargement automatique des 114 sourates
- Organisation des fichiers par récitateur
- Gestion des erreurs de téléchargement
- Nommage des fichiers selon les noms des sourates
- Création automatique des dossiers nécessaires

## Contribution
1. Forkez le projet
2. Créez votre branche (`git checkout -b feature/amelioration`)
3. Committez vos changements (`git commit -am 'Ajout de fonctionnalité'`)
4. Poussez vers la branche (`git push origin feature/amelioration`)
5. Créez une Pull Request

## Licence
MIT License

## Remarques
- Les fichiers MP3 téléchargés sont stockés dans le dossier `downloads/[nom_recitateur]/`
- Assurez-vous d'avoir les droits nécessaires pour télécharger les fichiers audio
