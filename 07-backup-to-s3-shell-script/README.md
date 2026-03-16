# Mini Project — Backup to Amazon S3 using Shell Script

## 📌 Project Overview

This project demonstrates how to automate application backups using a **Linux shell script** and store them securely in **Amazon S3**.

Instead of manually compressing folders and uploading them to cloud storage, the script automates the entire workflow:

1. Compress an application directory
2. Generate a timestamped backup archive
3. Upload the backup to an Amazon S3 bucket
4. Verify the upload success

This approach is commonly used in **DevOps environments for backup automation**.

---

#  Goal

Automate application data backups and store them safely in **AWS S3**.

This helps protect data from:

* Server crashes
* Accidental deletion
* Data corruption
* Infrastructure failures

---

# 🛠 Technologies Used

| Tool                   | Purpose                        |
| ---------------------- | ------------------------------ |
| **Linux Shell Script** | Automation                     |
| **tar**                | Compress application directory |
| **AWS CLI**            | Upload backup to Amazon S3     |
| **Amazon S3**          | Cloud storage for backups      |

---

# Project Structure

Example folder used for backup:

```
/home/sujith/Ansible
```

Backup archive generated:

```
/tmp/Ansible-YYYY-MM-DD.tar.gz
```

Example:

```
/tmp/Ansible-2026-03-16.tar.gz
```

---

#  Script Workflow

The script performs the following steps:

```
Application Folder
        ↓
Generate Date-Based Backup Name
        ↓
Compress Folder using tar
        ↓
Verify Archive File Exists
        ↓
Upload Archive to S3 Bucket
        ↓
Check Upload Status
```

---

#  Script

```bash
#!/bin/bash

src="/home/sujith/Ansible"
date=$(date -I)
dest="/tmp/Ansible-$date.tar.gz"

### Compress folder using tar
tar -cvzf "$dest" "$src"

if [ -f "$dest" ]; then
     aws s3 cp "$dest" s3://test2025f378b44d5290402592060bf82f5a0106
     
     if [ $? -eq 0 ]; then
        echo "Folder has been uploaded to S3 successfully"
     fi
else
     echo "Upload failed, please check the script"
fi
```

---

#  How to Run the Script

Make the script executable:

```
chmod +x backup.sh
```

Run the script:

```
./backup.sh
```

---

#  Example Output

```
upload: /tmp/Ansible-2026-03-16.tar.gz to s3://bucket-name/Ansible-2026-03-16.tar.gz
Folder has been uploaded to S3 successfully
```

---

# S3 Backup Result

After execution, the backup archive is stored in the S3 bucket.

Example object stored:

```
Ansible-2026-03-16.tar.gz
```

This allows maintaining **daily backup versions**.

---

#  Prerequisites

Before running the script ensure:

1. AWS CLI is installed

```
aws --version
```

2. AWS credentials are configured

```
aws configure
```

3. An S3 bucket already exists

4. Proper IAM permissions are assigned

---

#  Production Use Case

In real environments this script would usually run automatically using **cron jobs**.

Example:

```
Daily backup at 2 AM
```

Example cron job:

```
0 2 * * * /home/user/scripts/backup.sh
```

This creates **automated scheduled backups**.

---
#  Skills Practiced

This project demonstrates the following DevOps skills:

* Linux shell scripting
* Backup automation
* File compression using `tar`
* AWS CLI usage
* Uploading data to Amazon S3
* Error checking in scripts

---

# Production Relevance

Backup automation is a critical task in production systems.

Typical enterprise workflow:

```
Application Server
        ↓
Automated Backup Script
        ↓
Compressed Archive
        ↓
Upload to S3
        ↓
Secure Offsite Backup
```

Amazon S3 is commonly used for backup storage because it provides:

* High durability
* Scalability
* Cost-effective storage

---

# Key Learnings

Through this project, we learned:

* How to automate backups using shell scripts
* How to compress directories using `tar`
* How to upload files to S3 using AWS CLI
* How to verify backup and upload success
* How cloud storage can be integrated into automation workflows

---



