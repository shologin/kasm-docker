## About

Allows to run Kasm workspaces within Docker container.
Access container via public URL provided by NGROK.

## Installation

1. Start Docker.
2. Clone the repository. Once cloned, go into the folder.
3. Rename `.default.env` to `.env`.
4. Paste to `.env` your NGROK_AUTH_TOKEN (Optionally).
5. Run `docker-compose up -d`.
6. After containers are up and running use the tab `EXEC` of `ubuntu_kasm` container or connect to container via `docker exec -it ubuntu_kasm bash`, to run the following command:
   `/install_kasm.sh`.
7. Wait until Kasm will be installed. You will see auto-generated credentials in console.
8. Go to `https://localhost` in your browser (https://, not http:// !).
9. You should see the authorisation page. To log in, copy and paste credentials from install script console output.
10. Done.

If you've added NGROK_AUTH_TOKEN to `.env`, you can connect to your workspace via public URL provided by NGROK.

NGROK is an optional feature and can be disabled by removing service `ngrok` from `docker-compose.yml`.
