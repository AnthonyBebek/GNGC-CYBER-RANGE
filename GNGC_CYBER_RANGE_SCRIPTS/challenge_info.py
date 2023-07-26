import json

def get_challenge_settings(challenge_name):
    settings_file = "Admin_Settings.json"

    # Read settings from the JSON file
    with open(settings_file, "r") as f:
        settings = json.load(f)

    challenges = settings.get("Challenges")
    if not challenges:
        print("Error: 'Challenges' not found in the settings file.")
        return None

    for category, challenge_list in challenges.items():
        for challenge in challenge_list.values():
            if challenge["Challange_name"] == challenge_name:
                return challenge

    print(f"Challenge '{challenge_name}' not found in the settings.")
    return None
