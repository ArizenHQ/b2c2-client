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
end
```


### Directly in the application Instance

You can also pass any of those options inline when loading an instance of B2C2Client.

```ruby
  B2C2Client.new({endpoint_url: 'URL'}).call
```


You must specify the environment variable `B2C2_ENDPOINT_URL` or a `MissingEndpointUrl` exception will be raised:


## Environment Variables


### Compulsory

```bash
B2C2_ENDPOINT_URL='URL'
```

## Parameters

 - **B2C2_ENDPOINT_URL:** (default: 'URL', format: string) Endpoint path
 