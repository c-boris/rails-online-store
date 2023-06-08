
## Run locally

Assuming you have postgres installed (if not, figure that out)!

Do a standard bundle install

```bash
  bundle install
```

Initialize the migrations (if necessary, create a database first with rails db:create)

```bash
  rails db:migrate
```

Run the seed file to fill in the databse

```bash
  rails db:seed
```

Start the server. 

```bash
  rails server
```

You should be able to access it via your standard friendly http://localhost:3000/. Go apeshit!

## Visit the website

Painstakingly deployed to Heroku, you can visit the shop at this adress: https://kitten-app-dev.herokuapp.com/
