import json
import boto3
from flask import Flask, jsonify

app = Flask(__name__)

# AWS S3 configuration
AWS_REGION = 'us-east-1'
S3_BUCKET_NAME = 'missael-hire-project'
S3_FILE_KEY = 'example.json'

# Function to read and process the JSON file from S3
def process_json_data():
    try:
        # Download the JSON file from S3
        s3_client = boto3.client('s3', region_name=AWS_REGION)
        response = s3_client.get_object(Bucket=S3_BUCKET_NAME, Key=S3_FILE_KEY)
        json_data = json.loads(response['Body'].read().decode('utf-8'))

        # Process JSON data and calculate vulnerability counts per vendor_id
        result_data = {}
        for entry in json_data:
            vendor_id = entry.get('vendor_id')
            severity = entry.get('severity', 'UNKNOWN')

            if vendor_id:
                if vendor_id not in result_data:
                    result_data[vendor_id] = {'LOW': 0, 'MEDIUM': 0, 'HIGH': 0}

                if severity in result_data[vendor_id]:
                    result_data[vendor_id][severity] += 1

        return result_data
    except Exception as e:
        print(f"Error processing JSON data: {e}")
        return None

# Flask route to trigger the processing and return results
@app.route('/process_and_return_results', methods=['GET'])
def process_and_return_results():
    result_data = process_json_data()
    if result_data is not None:
        return jsonify(result_data)
    else:
        return jsonify({'error': 'Failed to process JSON data'}), 500

if __name__ == '__main__':
    app.run(debug=True)
