import json


def get_challenge_settings(challenge_name):
    settings_file = "../Admin_Settings.json"

    with open(settings_file, "r", encoding="utf-8") as f:
        settings = json.load(f)

    categories = settings.get("Categories")
    if not categories:
        print("Error: 'Categories' not found in the settings file.")
        return None

    for category, challenges in categories.items():
        for challenge_data in challenges.values():
            if challenge_data["Challenge_name"] == challenge_name:
                return challenge_data

    print(f"Challenge '{challenge_name}' not found in the settings.")
    return None

def get_challenges(Category):
    challenges_found = []
    settings_file = "../Admin_Settings.json"

    with open(settings_file, "r", encoding="utf-8") as f:
        settings = json.load(f)

    categories = settings.get("Categories")
    if not categories:
        print("Error: 'Categories' not found in the settings file.")
        return None

    for category, challenges in categories.items():
        if category == Category:
            for challenge_data in challenges.values():
                challenge_name = challenge_data['Challenge_name']
                challenges_found.append(challenge_name)
            return challenges_found

    print(f"Category '{Category}' not found in the settings.")
    return None
