import requests




website = "http://api.datamuse.com/words?sp="+"aasvoge"+"&max=1&md=fr"
response = requests.get(website)

ans = response.json()[0]
print(ans["word"])
print(ans["tags"][1][2:])