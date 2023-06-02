# README

1. Clone repository

```
git clone git@github.com:yuliatokaryk/ProsePonder.git
```

2. Run bundle
```
bundle install
```

3. Install Tailwind
```
./bin/rails tailwindcss:install
```

4. Create file .env and copy .env.example to .env

5. Create db and run migrations
```
rails db:create
rails db:migrate
```

6. Run App on your localhost
```
bin/dev
```