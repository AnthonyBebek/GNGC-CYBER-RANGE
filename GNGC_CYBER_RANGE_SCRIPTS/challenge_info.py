import json

def get_challenge_settings(challenge_name):
    settings_file = "../Admin_Settings.json"

    with open(settings_file, "r", encoding="utf-8") as f:
        settings = json.load(f)

    challenges = settings.get("Categories")
    if not challenges:
        print("Error: 'Categories' not found in the settings file.")
        return None

    for challenge_list in challenges.items():
        for challenge in challenge_list.values():
            if challenge["Challenge_name"] == challenge_name:
                return challenge

    print(f"Challenge '{challenge_name}' not found in the settings.")
    return None

def get_challanges(Category):
    challenges_found = []
    settings_file = "../Admin_Settings.json"

    with open(settings_file, "r", encoding="utf-8") as f:
        settings = json.load(f)

    challenges = settings.get("Categories")
    if not challenges:
        print("Error: 'Categories' not found in the settings file.")
        return None

    for challenge_list in challenges.items():
        for challenge in challenge_list.values():
            challenge_name = challenge['Challenge_name']
            challenges_found.append(challenge_name)
        return challenges_found

    print(f"Category '{Category}' not found in the settings.")
    return None
