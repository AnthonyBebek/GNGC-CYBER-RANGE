import challenge_info

print(str(challenge_info.get_challenge_settings("Old School")))
print("")
print(str(challenge_info.get_challenges("Basic Command Line")))
print("")
print(str(challenge_info.get_challenges('Dynamic Web')))

x = 1
while x == 1:
    challengeName = input('Enter Challenge Catagory: ')
    print(str(challenge_info.get_challenges(challengeName)))