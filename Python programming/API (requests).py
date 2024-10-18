import requests
from requests import get
response = get("https://api.tvmaze.com/shows/1")
response.status_code
response.json()

# get data from id 1-5
from requests import get
from time import sleep

base_url = "https://api.tvmaze.com/shows/"

for i in range(1,6):
    api_url = base_url + str(i)
    response = get(api_url)
    print(response.json()["name"])
    sleep(3)


# many type

base_url = "https://api.tvmaze.com/shows/"

tv_shows = []

for i in range(1,6):
    api_url = base_url + str(i)
    response = get(api_url)
    response_json = response.json()
    name = response_json["name"]
    language = response_json["language"]
    genres = response_json["genres"]
    rating = response_json["rating"]["average"]

    result = [
        name,
        language,
        genres,
        rating
    ]

    tv_shows.append(result)
    sleep(3)

print(tv_shows)


# write table
import csv

head = ["name", "language", "genres", "rating"]
with open("tv_shows.csv", "w") as file:
    writer = csv.writer(file)
    writer.writerow(head)
    writer.writerows(tv_shows)

!cat tv_shows.csv
