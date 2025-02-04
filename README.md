This repository contains two services user_service & payment service/

User service has a POST api to take payment data and send it through rabbitmq to payment service.

Payment service has a GET api to get all the payments to make sure that
the data synced well.


## Getting Started

You can **setup environment with Docker** OR **install all dependencies manually**:

### Setup Environment with Docker

<details>
<summary><b>1. Install Docker</b></summary>

Make sure you have installed the latest version of Docker from [the official website](https://docs.docker.com/desktop/mac/install/)

</details>

<details>
<summary><b>2. Run the application</b></summary>

If the previous stage completed without errors, open the terminal

- `docker-compose build && docker-compose up`

- User service is now available at `http://localhost:3000/`.
- Payment service is now available at `http://localhost:3001/`.


</details>

<details>
<summary><b>2. Run the unit tests</b></summary>

- `cd user_service/`
- `rspec`
- `cd payment_service/`
- `rspec`
</details>

## POSTMAN SCRIPT

### POST call to user service with payment data
- `curl --location 'http://localhost:3000/api/payments/publish' \
    --header 'Content-Type: application/json' \
    --data '{
      "user_id": 1,
      "amount": 322,
      "currency": "usd"
    }'`

### GET call to payment service to make sure that we get this data through rabbitmq
- `curl --location 'http://localhost:3001/api/payments'`
