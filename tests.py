#!/usr/bin/env python
import sys
import json
import requests


headers = {'Content-Type': 'application/json',}
votingUrl = "http://localhost/vote"
data = '{"topics":["dev", "ops"]}'
expectedWinner = "dev"
data2 = '{"topic":"dev"}'
requests.post(votingUrl, headers=headers, data=data)

requests.put(votingUrl, data=data2, headers=headers)
winner = requests.delete(votingUrl, headers=headers)

winner = json.loads(winner.text)['winner']

if winner == expectedWinner:
    sys.exit(0)
else:
    sys.exit(1)
