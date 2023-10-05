import challenge_info

print("This is the 'get_challanges_settings' command")
print("")
print(str(challenge_info.get_challenge_settings("Generic Travel")))
print("")
print("This is the 'get_category' command")
print("")
print(str(challenge_info.get_category()))
print("This is the 'get_challanges' command")
print("")
print(str(challenge_info.get_challenges("Basic Command Line")))
print("")
print(str(challenge_info.get_challenges('Dynamic Web')))


x = 1
while x == 1:
    challengeName = input('Enter Challenge Catagory: ')
    print(str(challenge_info.get_challenges(challengeName)))