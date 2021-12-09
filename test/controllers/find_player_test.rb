require 'dotenv'
require 'json'
require 'rest-client'
Dotenv.load

username = "lagega"
@response =  RestClient.get "https://br1.api.riotgames.com/lol/summoner/v4/summoners/by-name/#{username}?api_key=RGAPI-aedd82c5-fcc1-476a-9e61-486ba5fbec19",
{content_type: :json, accept: :json}

@response =  RestClient.get "https://br1.api.riotgames.com/lol/league/v4/entries/by-summoner/#{JSON.parse(@response.body)["id"]}?api_key=RGAPI-aedd82c5-fcc1-476a-9e61-486ba5fbec19",
{content_type: :json, accept: :json}
body = JSON.parse(@response.body)


p body[0]["tier"]
p body[0]["rank"]
