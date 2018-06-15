import requests

ipf = open("wordlist.txt", "r")
opf = open("wordList3.txt", "w")


words = [line.rstrip('\n') for line in ipf]
limited = words[0:19213]

for word in limited:
	print word + "..." 
	website = "http://api.datamuse.com/words?sp="+word+"&max=1&md=fr"
	response = requests.get(website).json()
	if response:
		ans = response[0]
		retrieved = ans["word"]
		if (retrieved == word):
			opf.write(retrieved + " ")
			opf.write(ans["tags"][1][2:] + "\n")

ipf.close()
opf.close()
