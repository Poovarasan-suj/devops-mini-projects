# AWS EC2 Automation using Python (boto3)

## Project Goal

Automate basic AWS EC2 operations using **Python and boto3**.

This script allows us to:

* Start an EC2 instance
* Stop an EC2 instance
* Understand AWS API responses (JSON format)

This exercise helps build **cloud automation skills**, which are important for DevOps and Cloud Engineers.

---

# Technologies Used

* **Python 3**
* **boto3 (AWS SDK for Python)**
* **AWS EC2**
* **Linux CLI**

---

# What We Learned

## 1. boto3 (AWS SDK for Python)

`boto3` is the Python library used to interact with AWS services through APIs.

Example:

```python
import boto3
ec2 = boto3.client('ec2')
```

This creates a connection between the Python script and the **AWS EC2 service**.

Using boto3 we can automate tasks such as:

* Start EC2
* Stop EC2
* Create instances
* Delete resources
* Manage storage

This is widely used for **cloud automation**.

---

# Script Explanation

## Importing Required Modules

```python
import sys
import boto3
from botocore.exceptions import ClientError
```

### sys

Used to read **command line arguments**.

Example:

```
python3 boto3-start.py ON instance-id
```

### boto3

AWS SDK used to communicate with AWS services.

### ClientError

Handles errors returned from AWS API.

Without this, the script may crash if AWS returns an error.

---

# Command Line Arguments

```python
instance_id = sys.argv[2]
action = sys.argv[1].upper()
```

Example command:

```
python3 boto3-start.py ON i-123456
```

Arguments:

| Argument    | Meaning           |
| ----------- | ----------------- |
| ON          | action to perform |
| instance-id | EC2 instance ID   |

`.upper()` ensures the action is always uppercase.

---

# Creating EC2 Client

```python
ec2 = boto3.client('ec2')
```

This connects the Python script to the **EC2 service API**.

Flow:

Python Script → boto3 → AWS EC2 API

---

# Dry Run Concept

Before performing an operation, the script performs a **DryRun check**.

Example:

```python
ec2.start_instances(InstanceIds=[instance_id], DryRun=True)
```

DryRun means:

> Test if the request is allowed **without actually executing it**.

If permissions are correct, AWS returns:

```
DryRunOperation
```

If permissions are incorrect, AWS returns an error.

Once permission is verified, the script runs the real command.

---

# Starting an EC2 Instance

```python
ec2.start_instances(InstanceIds=[instance_id], DryRun=False)
```

This sends an API request to AWS to start the instance.

Example output:

```
Previous State: stopped
Current State: pending
```

Instance lifecycle:

```
stopped → pending → running
```

---

# Stopping an EC2 Instance

```python
ec2.stop_instances(InstanceIds=[instance_id], DryRun=False)
```

Example output:

```
Previous State: running
Current State: stopping
```

Instance lifecycle:

```
running → stopping → stopped
```

---

# Understanding AWS API Response

AWS APIs return data in **JSON-like dictionary format**.

Example simplified response:

```
{
  "StartingInstances": [
    {
      "InstanceId": "i-123456",
      "CurrentState": {
        "Name": "pending"
      },
      "PreviousState": {
        "Name": "stopped"
      }
    }
  ]
}
```

Important fields:

| Field         | Meaning                 |
| ------------- | ----------------------- |
| InstanceId    | EC2 instance ID         |
| CurrentState  | Current instance state  |
| PreviousState | State before the action |

---

# Accessing Values from JSON Response

Example:

```python
response['StartingInstances'][0]['InstanceId']
```

Explanation:

| Part              | Meaning              |
| ----------------- | -------------------- |
| StartingInstances | AWS response section |
| [0]               | first item in list   |
| InstanceId        | instance identifier  |

Example output:

```
Instance: i-037cd0e643e6a20e3
Current State: pending
Previous State: stopped
```

---

# Common EC2 States

| Code | State         |
| ---- | ------------- |
| 0    | pending       |
| 16   | running       |
| 32   | shutting-down |
| 48   | terminated    |
| 64   | stopping      |
| 80   | stopped       |

---

# Example Commands

Start instance:

```
python3 boto3-start.py ON i-037cd0e643e6a20e3
```

Stop instance:

```
python3 boto3-start.py OFF i-037cd0e643e6a20e3
```

---

# Skills Practiced in This Project

* Python scripting
* AWS boto3 SDK usage
* EC2 instance automation
* API response parsing
* Error handling using ClientError
* Command-line argument handling

---

# Why This Is Important for DevOps

DevOps engineers often automate cloud operations instead of doing them manually.

Examples:

* Start/stop instances automatically
* Schedule server shutdowns
* Perform maintenance tasks
* Automate infrastructure operations

Using **boto3 + Python**, we can automate many AWS tasks.

---

# Summary

In this project we learned:

* How to use **boto3 to interact with AWS**
* How to start and stop EC2 instances using Python
* How to read and extract information from AWS API responses
* How to handle AWS errors safely using `ClientError`
* How to use command-line arguments in automation scripts

This is a basic but important step toward **Cloud Automation and DevOps practices**.
