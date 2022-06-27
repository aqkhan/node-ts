FROM node:lts

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
COPY prisma ./prisma/
COPY .env ./
COPY tsconfig.json ./

COPY . .

RUN npm install

ENV DATABASE_URL="postgresql://postgres:postgres@postgres:5432/ncr?connect_timeout=300"

RUN npx prisma generate

EXPOSE 4000
CMD [ "node", "dist/index.js" ]