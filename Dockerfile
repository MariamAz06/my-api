# Étape 1 : Utiliser l'image de Node.js comme base
FROM node:18

# Étape 2 : Créer le répertoire de travail dans le conteneur
WORKDIR /usr/src/app

# Étape 3 : Copier les fichiers package.json et package-lock.json
COPY package*.json ./

# Étape 4 : Installer les dépendances
RUN npm install

# Étape 5 : Copier tous les fichiers du projet dans le conteneur
COPY . .

# Étape 6 : Construire l'application
RUN npm run build

# Étape 7 : Exposer le port 3000
EXPOSE 3000

# Étape 8 : Lancer l'application
CMD ["npm", "run", "start:prod"]
