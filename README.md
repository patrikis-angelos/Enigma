
![](https://img.shields.io/badge/Microverse-blueviolet)

# EniGma

EniGma? is a Desktop app for articles about different scientific fields where

- A visitor:
  - can see a page with the best article
  - All the latest articles
  - All articles in each category
- A User:
  - Can create an article
  - Upvote and Downvote (Previously upvoted) articles
  - See all the articles written by a user

![Screenshot](/scrn_img/scrn)

## Built With

- Ruby on Rails
- Ruby 2.7.2
- SCSS

## Getting Started

You need the Postgresql database installed before proceeding with the below steps
To get started with the project follow the steps below:
- You must have yarn installed
- `git clone https://github.com/patrick-angelos/Enigma.git`
- `bundle install`
- `rails webpacker:install`
- `rails db:create`
- `rails db:migrate`
- `rails s` to start the server
- Go to `localhost:3000` on your browser

Setting Up:
  To set up the database for the project you only need to create the desired Categories with name and priority
  - `rails c`
  - `Category.create(name: "yourCategoryName", priority: "showPriority")`

  ## [Live Version](https://enigma-articles.herokuapp.com/)

## Author

👤 **Patrikis Angelos**

- GitHub: [@patrick-angelos](https://github.com/patrick-angelos)
- Twitter: [@AngelosPatrikis](https://twitter.com/AngelosPatrikis)
- LinkedIn: [Angelos Patrikis](https://www.linkedin.com/in/angelos-patrikis-a590a61b5/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- To [Nelson Sakwa](https://www.behance.net/sakwadesignstudio) for creating this awasome layout.
- To Microverse for their `README` template.

## 📝 License

This project is under the [Creative Commons license](https://creativecommons.org/licenses/by-nc/4.0/) and you can Share, copy and redistribute the material in any medium or format. Adapt, remix, transform, and build upon the material as long as you give appropriate credit to the creator (Nelson Sakwa), provide a link to the license, and indicate if changes were made.
You may not use the material for commercial purposes.