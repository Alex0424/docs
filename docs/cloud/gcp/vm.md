# Create a VM

1. Go to the Google Cloud Console

2. Select or create a new project

3. Enable compute engine

4. Go to `Compute Engine` and click on `Create Instance`
    - Machine Configuration
        - Name: europe-north2 (Stockholm)
        - Region / Zone: europe-north2-a
        - Machine type: e.g. e2-micro (for testing)
    - OS and storage
        - OS: Debian
        - Version: GNU/Linux 12 (bookworm)
        - Boot disk type: balanced persistent disk
        - Size: 10gb (for testing)
    - Data Protection
        - Leave everything as default
    - Networking
        - Allow `HTTP` and `HTTPS` if you will test an web app
    - Observability
        - Enable: Install Ops Agent for Monitoring and Logging
    - Security
        - Leave everything as default

5. Create
