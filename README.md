# Johari Window Too

This project uses [Omniauth Census](https://github.com/turingschool-projects/omniauth-census), which requires a secure connection.

An SSL certificate has been generated and saved in this repository to allow you to run this project locally in your development environment. In order to start the Rails server:

```
export CENSUS_ENV=production
rails s -b 'ssl://localhost:3000?key=.ssl/localhost.key&cert=.ssl/localhost.crt'
```


