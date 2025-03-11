# Bolha

## Table of Contents
+ [About](#about)
+ [Getting Started](#getting_started)
+ [Usage](#usage)

## About <a name = "about"></a>
Website representing Bolha. People can post their stuff for sale on this webpage. People will be able to buy and sell interesting items. It was made in ruby on rails. It runs on Render hosting service with a domain from Neoserv.

## Getting Started <a name = "getting_started"></a>
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

What things you need to install the software and how to install them. Also some webisites for hosting purpouses.

Visual Studio Code (or some code editor for changing and viewing code) https://code.visualstudio.com/download
Github Desktop https://desktop.github.com/download/
Ubuntu installed localy from Microsoft Store https://apps.microsoft.com/detail/9PDXGNCFSCZV?hl=en-us&gl=SI&ocid=pdpshare
Render (or other hosting service) https://render.com/
Neoserv (or other domain services) https://www.neoserv.si/?gad_source=1&gclid=CjwKCAjwvr--BhB5EiwAd5YbXvJz4_sR-nHii0E9GDt-VQWJ4qXbtnk8WtcrtnHmZHtX1bJENK78axoCCbUQAvD_BwE


### Installing

A step by step series of examples that tell you how to get a development env running.

Install all Prerequisites

```
You download all the programms through the links I gave in Prerequisites and register in them, if you haven't before.
```

Pulling the files

```
You pull these files in GitHub Desktop and open them in your Visual Studio code to edit and view
```

Deploying the project

```
This project was created in Ruby on Rails. You need to have Ruby 3.3.7 version and Rails 8.0.1 version. In deploy.yml file you need to configure the settings for your webiste. You need to create your .env file Where you will have your GitHub token stored. After that you need to put your admin email and pass in render-build.sh which will be used in seed.rb file. After that you deploy it on your hosting website where you connect it with your domain.
```

## Usage <a name = "usage"></a>

To access the full website, you access it through your server on which everything should work, if you followed the instructions. To view and edit code from the website, you can edit it in the server or VS Code. If you change anything in the code and deploy again, it will reset your database. You need to have tasks in render-build.sh or use a disk on the Render hosting.
Hope you will be able to access the code and use it :)
