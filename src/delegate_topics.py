import csv
import datetime
import os

# Define the directory for delegated topics files
DELEGATED_TOPICS_DIR = "/home/mephibosheth/AIUX/Google/Gemini-CLI/delegated_topics"

def get_delegated_topics_file_path():
    """
    Generates a timestamped file path for the delegated topics CSV.
    """
    if not os.path.exists(DELEGATED_TOPICS_DIR):
        os.makedirs(DELEGATED_TOPICS_DIR)
    timestamp = datetime.datetime.now().strftime("%Y-%m-%dT%H-%M-%S")
    file_name = f"{timestamp}-Session-Delegated-Topics.csv"
    return os.path.join(DELEGATED_TOPICS_DIR, file_name)

def add_topic_to_delegation_file(topic: str, file_path: str = None):
    """
    Adds a topic to the delegated topics CSV file.
    If file_path is not provided, a new timestamped file is created.
    """
    if file_path is None:
        file_path = get_delegated_topics_file_path()
        # Write header if it's a new file
        if not os.path.exists(file_path) or os.stat(file_path).st_size == 0:
            with open(file_path, 'w', newline='') as csvfile:
                csv_writer = csv.writer(csvfile)
                csv_writer.writerow(["timestamp", "topic"])

    with open(file_path, 'a', newline='') as csvfile:
        csv_writer = csv.writer(csvfile)
        csv_writer.writerow([datetime.datetime.now().isoformat(), topic])
    print(f"Topic '{topic}' added to {file_path}")

if __name__ == "__main__":
    # Example usage:
    # Create a new file and add a topic
    add_topic_to_delegation_file("Research on quantum computing advancements")
    add_topic_to_delegation_file("Summarize recent AI ethics discussions")

    # Add a topic to an existing file (if you know its path)
    # add_topic_to_delegation_file("Analyze market trends for renewable energy", "/path/to/existing-file.csv")