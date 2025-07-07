import sys
from datetime import datetime


def parse_log_entry(line):
    """Parses a log line to extract the timestamp."""
    try:
        timestamp_str = line.split("[")[1].split("]")[0]

        log_time_format = "%d/%b/%Y:%H:%M:%S %z"
        return datetime.strptime(timestamp_str, log_time_format)
    except (IndexError, ValueError):
        return None


def main():
    # Check for correct number of command-line arguments
    if len(sys.argv) != 3:
        print(
            "Usage: python3 filter_by_date.py 'YYYY-MM-DD HH:MM:SS' 'YYYY-MM-DD HH:MM:SS'"
        )
        print(
            "Example: python3 filter_by_date.py '2021-05-30 12:22:00' '2021-05-30 12:33:12'"
        )
        sys.exit(1)

    # Parse start and end times from arguments
    try:
        time_format = "%Y-%m-%d %H:%M:%S"
        # Naive datetime objects (no timezone)
        start_time_naive = datetime.strptime(sys.argv[1], time_format)
        end_time_naive = datetime.strptime(sys.argv[2], time_format)
    except ValueError:
        print("Error: Invalid date format. Please use 'YYYY-MM-DD HH:MM:SS'.")
        sys.exit(1)

    log_file = "apache_access"

    # Read the log file line by line
    try:
        with open(log_file, "r") as f:
            for line in f:
                log_time = parse_log_entry(line)
                if log_time:
                    log_time_naive = log_time.replace(tzinfo=None)

                    # Check if the log entry is within the time range
                    if start_time_naive <= log_time_naive <= end_time_naive:
                        print(line, end="")
    except FileNotFoundError:
        print(f"Error: Log file '{log_file}' not found.")
        sys.exit(1)


if __name__ == "__main__":
    main()
