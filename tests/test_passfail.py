import glob
import os


def test_passfail():
    # Get the list of files in the ./passfail/ directory
    files = glob.glob("./passfail/*")

    # Check if there are any files in the directory
    assert len(files) > 0, "No files found in the ./passfail/ directory"

    # Find the most recent file
    most_recent_file = max(files, key=os.path.getctime)

    with open(most_recent_file, "r") as fp:
        lines = fp.readlines()
        assert len(lines) > 0
        assert lines[0].startswith("pass")
