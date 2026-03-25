# Jenkins Job Triggers

## 1. Poll SCM

### Overview

**Poll SCM** periodically scans the repository for changes and triggers a build when updates are detected.

### Enable Poll SCM

1. Open the Jenkins job.
2. Go to **Configure**.
3. Scroll to **Build Triggers**.
4. Enable **Poll SCM**.
5. Add a cron expression.

Example:

```diagram
H/5 * * * *
```

This checks the repository every 5 minutes.

## 2. Build after other projects are built

### Overview
This trigger allows a Jenkins job to start automatically after another specified job finishes successfully.

### Enable the Trigger

1. Open your Jenkins job.
2. Click **Configure**.
3. Scroll to **Build Triggers**.
4. Enable **Build after other projects are built**.
5. In **Projects to watch**, enter the name of the upstream job.

Example: `UpstreamJobName`

### Test the Trigger

1. Start the **upstream job** manually.
2. Wait for it to finish.
3. Verify that the **downstream job** starts automatically.

### Workflow

```diagram
Upstream Job
↓
Build completes
↓
Downstream Job starts automatically
```

## 3. Remote Trigger

### Overview

Remote triggering allows you to start a Jenkins job from an external script or system using an HTTP request.

### Enable the Remote Trigger

#### Requirements

* `curl`
* `wget`

### Step 1 — Enable Remote Trigger in Jenkins

1. Open your Jenkins job.
2. Click **Configure**.
3. Go to **Build Triggers**.
4. Enable:

```sh
Trigger builds remotely (e.g., from scripts)
```

5. Create a token in **Authentication Token**.

Example:

```sh
mybuildtoken
```

Your trigger URL format will be:

```sh
http://JENKINS_URL/job/JOB_NAME/build?token=TOKEN_NAME
```

Example:

```sh
http://localhost:8080/job/BuildTriggerTest/build?token=mybuildtoken
```

### Step 2 — Generate Jenkins API Token

1. Click your **username** (top-right corner).
2. Go to **Security**.
3. Click **Add new Token**.
4. Copy the token.

Example credentials format:

```sh
username:api_token
```

Example:

```sh
admin:1188c983482ac7f4a125a83c1316f43b30
```

### Step 3 — Generate Jenkins Crumb (CSRF Protection)

Run the following command to retrieve the Jenkins crumb:

```sh
wget -q \
--auth-no-challenge \
--user USERNAME \
--password API_TOKEN \
--output-document - \
"http://JENKINS_IP:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,\":\",//crumb)"
```

Example output:

```
Jenkins-Crumb:eb5d4ffd2ee8cabb4d15ee6d515bba5a6cc7f2045b4eb640e43914342d851ca8
```

### Step 4 — Trigger the Jenkins Job

Use `curl` to trigger the job:

```bash
curl -X POST \
http://USERNAME:API_TOKEN@JENKINS_IP:8080/job/JOB_NAME/build?token=TOKEN_NAME \
-H "Jenkins-Crumb:CRUMB"
```

### Example

```bash
curl -X POST \
http://admin:1188c983482ac7f4a125a83c1316f43b30@localhost:8080/job/BuildTriggerTest/build?token=mybuildtoken \
-H "Jenkins-Crumb:eb5d4ffd2ee8cabb4d15ee6d515bba5a6cc7f2045b4eb640e43914342d851ca8"
```

This will remotely trigger the Jenkins job **BuildTriggerTest**.

### Quick Flow

```diagram
Create API Token
↓
Enable "Trigger builds remotely"
↓
Generate Jenkins Crumb
↓
Send POST request using curl
↓
Jenkins job starts
```
