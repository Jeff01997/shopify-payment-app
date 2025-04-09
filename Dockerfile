FROM node:20-alpine

EXPOSE 3000

WORKDIR /app
COPY . .

ENV NODE_ENV=production

RUN npm install --omit=dev
RUN npm run build

# You'll probably want to remove this in production, it's here to make it easier to test things!
RUN rm -f prisma/dev.sqlite

# install xdg-utils, this will install xdg-open and related tools, allowing Shopify CLI i
# (or anything else using xdg-open) . 
RUN apk update
RUN apk add xdg-utils

CMD ["npm", "run", "docker-start"]
