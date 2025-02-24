# Homey Coversation History

Setup Instructions

## 1 Install Dependencies

Ensure you have Docker and Docker Compose installed.

## 2 Start the Application

Run the following command:

```
docker-compose up --build
```

This command will build the Docker image, start the PostgreSQL database and start the Rails application.

## 3 Setup the Database

Once the container is running, open another terminal and run:

```
docker-compose exec web rails db:setup
```

This command will create the database, run migrations and seed initial data.

## 4 Access the Application

Open http://localhost:3000 in your browser.

## 5 Test with Seeded Users

You can log in using the following test accounts:

```
User# 1
Email: alice@example.com
Password: Pas$w0rd2
```

```
User# 2
Email: bob@example.com
Password: Pas$w0rd2
```
