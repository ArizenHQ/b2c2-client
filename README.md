# B2C2 Client

__B2C2 Client__ is an interface to interact with the B2C2's API, the OTC liquidity provider. 


## Installation

### Bundle and install the gem as a standalone

- Clone the repository
- Install Ruby 2.5.0
- Execute `bundle install`

## Configuration

You can pass multiple variables that will be used in the configuration.

### As an initializer

```ruby
B2C2Client.configure do |config|
  config.endpoint_url = 'URL'
  config.api_token = 'URL'
end
```


### Directly in the application Instance

You can also pass any of those options inline when loading an instance of B2C2Client.

```ruby
  B2C2Client.new({endpoint_url: 'URL', api_token: 'TOKEN'})
```


You must specify the environment variable `B2C2_ENDPOINT_URL` and `B2C2_API_TOKEN` or a `MissingEndpointUrl` exception will be raised:


## Usage

For launch IRB and load + require automatically lib B2C2Client

```bash
$ bundle console
```

```ruby
  params = {endpoint_url: 'your_endpoint_url', api_token: 'your_api_token'}
  client = B2C2Client.new(params).private
```

Where `params` is , the hash of the possible environment variables.

Then simply call the method you wish to perform:

```ruby
  client.request_for_quote(query_parameters).perform
```

Where `query_paramters` are the possible parameters accepted by `B2C2`. Please visit the [docs](https://docs.b2c2.com/?python#instruments) for more info.

### List of endpoints :

#### Balance [docs](https://docs.b2c2.com/#balances)

```ruby
  client.balance.perform
```

#### Instruments [docs](https://docs.b2c2.com/#instruments)

```ruby
  client.instruments.perform
```

#### Request For Quote [docs](https://docs.b2c2.com/#request-for-quote)

```ruby
  quote = {client_rfq_id: SecureRandom.uuid,quantity: 1,side: 'buy',instrument: 'BTCUSD.SPOT'}
  response = client.request_for_quote(quote).perform
```

#### Trade [docs](https://docs.b2c2.com/#trade)

```ruby
  # for a trade you need to do a Request For Quote before tu get a rfq_id and price parameters
  rfq_id = response["rfq_id"]
  price = response["price"]

  trade = {rfq_id: rfq_id,quantity: 1,side: 'buy',instrument: 'BTCUSD.SPOT', price: price}
  client.trade(trade).perform
```

## Environment Variables


### Compulsory

(Can also be passed along with parameters)

```bash
B2C2_ENDPOINT_URL='URL'
ENDPOINT_API_TOKEN='URL'

```

## Parameters

 - **B2C2_ENDPOINT_URL:** Endpoint Path for B2C2
 - **ENDPOINT_API_TOKEN:** API Token for B2C2
