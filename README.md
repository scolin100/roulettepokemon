# 🎰 La Roulette Pokémon — installation dans OBS

Guide pour utiliser la roulette comme **source navigateur OBS**.
Il part du principe que tu as déjà téléchargé **tous les fichiers** du projet depuis GitHub
(https://github.com/scolin100/roulettepokemon) et que tu les as mis dans **un même dossier**, par exemple `D:\scene OBS\roulette\`.

> Ne déplace pas `index.html` seul : il doit rester à côté de `liste.js` et du dossier `allpokemon`.

---

## 1. Vérifier le dossier

Le dossier doit contenir :

- `index.html`
- `liste.js`
- le dossier `allpokemon` (les images)
- le dossier `allpokemonshiny` (les variantes shiny, nommées `0001 - bulbizarre shiny.gif`)
- `liste_formes.js`
- le dossier `allformealternative` (méga, Primo et autres formes, nommées `0006 - dracaufeu méga x.gif`)
- le dossier `allformealternativeshiny` (leurs shiny, nommés `0006 - dracaufeu méga x shiny.gif`)

Si tu modifies le contenu de `allpokemon`, `allformealternative` ou `allformealternativeshiny` (ajout ou retrait d'images), **double-clique sur `creer_liste.bat`** pour mettre `liste.js` et `liste_formes.js` à jour.

Les formes alternatives ne sont pas tirées directement : quand un Pokémon est tiré, **sa forme est choisie** au résultat.
- Par défaut, chaque forme a la même chance que la forme de base (mâle / femelle, motifs de Prismillon, races de Tauros de Paldea…).
- Pikachu et Évoli : 10 % de chance d'être une de leurs variantes. Zarude Papa et Shaymin Céleste : 10 %. Deusolourdo forme Triple : 1 %.
- Morphéo et Météno : 5 % pour chacune de leurs formes.
- Vivaldaim et Haydaim : la forme de la saison en cours.
- À débloquer : Kyurem Noir / Blanc (avoir obtenu Kyurem, Reshiram et Zekrom), Sylveroy cavaliers (Sylveroy, Blizzeval et Spectreval), Necrozma Crinière du Couchant / Ailes de l'Aurore (Necrozma, Solgaleo et Lunala), Ultra-Necrozma (avoir obtenu les deux formes de Necrozma).

Le Pokédex contient les Pokémon et toutes leurs formes.

Les **méga** (et Primo / Sacha) ne sont pas tirées directement : quand le Pokémon tiré a une méga, il a **10 % de chance de méga-évoluer** au résultat (la carte se retourne et révèle la méga). Un shiny ne méga-évolue que si la méga existe en shiny. Avec le filtre Pokémon Champions, seule une méga autorisée dans le règlement coché peut sortir (ex. Raichu est autorisé dès M-A, mais ses Méga X / Y seulement à partir de M-B). Les méga obtenues sont rangées dans le **💠 Méga Dex** (case à cocher dans le Pokédex).

## 2. Ajouter la roulette dans OBS

1. Dans OBS : **Sources → ➕ → Navigateur**, puis **Créer**.
2. **Décoche** « Fichier local » et colle dans **URL** l'adresse de ton fichier, suivie de `?overlay`.
   Exemple, avec le dossier `D:\scene OBS\roulette\` :

   `file:///D:/scene%20OBS/roulette/index.html?overlay`

   (les `\` deviennent des `/`, et chaque espace devient `%20`)
3. **Largeur : 1080 — Hauteur : 1920** (ou la taille de ta scène).
4. Valide avec **OK**. Fond transparent, sans panneau : seule la roue apparaît.
5. Pour lancer un tirage : **clic droit sur la source → Interagir**, puis clique dans la fenêtre qui s'ouvre.

### ✨ Shiny
À chaque tirage, le gagnant a **1 chance sur 2048** d'être sa version shiny (image prise dans `allpokemonshiny`, carte dorée, ✨ autour du nom, « pseudo a tiré bulbizarre shiny »). Si un Pokémon n'a pas de fichier shiny, il sort en version normale. Aucune mise à jour de `liste.js` n'est nécessaire.

## 3. Régler le comportement (options)

Ajoute des options à la fin de l'adresse, séparées par `&`.

Exemple : `file:///D:/scene%20OBS/roulette/index.html?overlay&cache=1&duree=8`

| Option | Effet |
|---|---|
| `overlay` | Obligatoire : mode OBS (fond transparent, sans panneau) |
| `cache=1` | La roue est invisible tant qu'il n'y a pas de tirage |
| `duree=8` | Secondes d'affichage du résultat avant de recacher la roue (avec `cache=1`) |
| `auto=1` | Lance **un** tirage automatique 1 seconde après le chargement |
| `boucle=1` | Avec `auto`, relance le tirage en boucle |
| `gen=1,2,7` | Limite aux générations indiquées |
| `champions=1` | Filtre Pokémon Champions, règlement M-C (sans Méga). `champions=ma` : règlement M-A (premier format) ; `champions=mb` : règlement M-B ; on peut en combiner plusieurs (`champions=mc,mb`) |
| `retirer=1` | Un Pokémon tiré ne ressort plus |
| `son=1` | Active le son (coupé par défaut) |
| `theme=rouge` | Thème : `default`, `rouge`, `vert`, `violet`, `jaune`, `rose`, `turquoise` |
| `fond=vert` | Fond uni : `vert`, `bleu`, `noir`, `blanc`, un code hexa (`ff00ff`) ou `theme` (fond animé) |
| `deco=1` | Rayons et bulles sur fond transparent |
| `mega=N` | Chance de méga-évolution au résultat : `N` % (défaut `10`). `mega=0` désactive les méga |
| `shiny=N` | Chance d'obtenir la version shiny : 1 sur `N` (défaut `2048`). `shiny=0` désactive les shinys |
| `debug=1` | Ligne verte de diagnostic en haut de l'écran (à retirer ensuite) |

Après chaque modification de l'adresse : **clic droit sur la source → Actualiser le cache de la page actuelle**.

## 4. (Facultatif) Lancer la roue avec les points de chaîne Twitch

Il faut être **Affilié ou Partenaire Twitch**. Tu n'as **rien à héberger** ni aucune application à créer : tu utilises le site de la roulette
(`https://laroulettepokemon.stream/`) et son identifiant Twitch. Le jeton que tu obtiens est **le tien**, il ne donne accès qu'à **ta** chaîne,
et il reste dans ton adresse OBS : le site ne stocke rien.

### a) Créer la récompense
Tableau de bord du créateur → **Communauté → Points de chaîne → Gérer les récompenses → Créer une récompense personnalisée**.
Donne-lui un nom simple, par exemple `roue`.

### b) Récupérer ton jeton (dans ton navigateur habituel, pas dans OBS)
Ouvre cette adresse (remplace `roue` par le nom exact de ta récompense) :

`https://laroulettepokemon.stream/?overlay&clientid=zbdo1tkj9dk5wips0iqsa0p82ao4uw&recompense=roue&montrerjeton=1`

Clique sur « Twitch : cliquer ici pour se connecter », autorise avec le compte de ta chaîne, puis copie le texte de la zone qui apparaît en haut à gauche : c'est ton **jeton**.

### c) Adresse à mettre dans OBS

`https://laroulettepokemon.stream/?overlay&cache=1&duree=8&clientid=zbdo1tkj9dk5wips0iqsa0p82ao4uw&recompense=roue&jeton=TON_JETON`

À chaque utilisation de la récompense, la roue apparaît, tourne une fois, affiche **« pseudo a tiré pokémon »**, puis disparaît.
Dans ce mode, le clic et `auto` sont désactivés. Tu peux ajouter toutes les options du tableau ci-dessus (`champions=mc`, `shiny=…`, `theme=…`).

**Plusieurs récompenses en même temps :** elles sont mises en **file d'attente** et traitées une par une, sans en perdre aucune
(maximum 100 en attente). Entre deux tirages, la roue attend `duree` secondes pour que chaque résultat reste lisible.

> Avancé : tu peux aussi héberger toi-même la roulette et créer ta propre application sur https://dev.twitch.tv/console/apps
> (catégorie **Website Integration**, type **Public**, URL de redirection = l'adresse exacte de ta roulette avec le `/` final), puis utiliser ton propre Client ID.

### Durée de vie du jeton
Le jeton dure en général **environ 60 jours** (Twitch ne le garantit pas). Quand il reste **7 jours ou moins**, un bandeau rouge
« ⚠️ Jeton Twitch : expire dans X jours » s'affiche 30 secondes en haut de la source au chargement : il est visible dans l'aperçu d'OBS,
mais aussi à l'antenne si la source est en direct à ce moment-là. Ajoute `&alerte=0` pour le désactiver.
Avec `&debug=1`, la ligne verte indique aussi la durée restante (`jeton=12j`). Pour renouveler : refais l'étape b.

### e) (Facultatif) Écrire le résultat dans le tchat Twitch
Ajoute `&chat=1` à l'adresse (à l'étape b **et** à l'étape c) pour que la roulette envoie aussi le message
**« pseudo a tiré pokémon »** dans le tchat de ta chaîne, en même temps qu'il s'affiche à l'écran.

- Le message part **depuis ton compte** (celui qui a donné l'autorisation).
- Il faut **refaire l'étape b avec `&chat=1`** : le jeton doit inclure l'autorisation d'écrire dans le tchat (un ancien jeton ne suffit pas).
- Si l'autorisation manque, ou si Twitch refuse l'envoi, un petit message apparaît en bas à gauche de la source (visible avec `debug=1`).

> ⚠️ Le jeton donne accès à la lecture des récompenses de ta chaîne : ne le montre jamais à l'écran, ne le partage pas, et retire `montrerjeton=1` de l'adresse d'OBS.
> Il expire au bout de quelques semaines : refais l'étape b) pour en obtenir un nouveau.

## 5. Dépannage

| Problème | Piste |
|---|---|
| La roue n'apparaît pas | Vérifie l'adresse (`/` et `%20`), la taille 1080×1920, puis « Actualiser le cache » |
| Écran vide avec `cache=1` | Normal : la roue n'apparaît qu'au tirage. Clic droit → Interagir pour tester |
| « Liste introuvable » | Lance `creer_liste.bat` et vérifie que `liste.js` est à côté de `index.html` |
| La récompense ne lance rien | Ajoute `&debug=1` : la ligne verte indique si Twitch est connecté ou si le jeton est refusé. Vérifie que `recompense=` est exactement le nom de ta récompense |
| Erreur de redirection sur la page Twitch | Utilise exactement l'adresse `https://laroulettepokemon.stream/…` donnée à l'étape b (avec le `/` après `.stream`). Si tu héberges toi-même la roulette, l'URL de redirection de ton application doit être cette adresse exacte |

---

Projet de fan, sans lien officiel avec Nintendo, Game Freak ou The Pokémon Company.
Roulette créée par [scolin100](https://www.twitch.tv/scolin100).
