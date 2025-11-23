FROM node:20-alpine

# Dossier de travail
WORKDIR /app

# Copier les fichiers de dépendances
COPY package.json yarn.lock ./

# Installer les dépendances
RUN yarn install --frozen-lockfile

# Copier le reste du code
COPY . .

# Build de la version production
RUN yarn build

# Port par défaut de l'app
ENV PORT=8080
EXPOSE 8080

# Lancer l'app
CMD ["yarn", "start"]
