# Telegram Web App Integration

This guide explains how to build, host, and configure your Flutter app as a Telegram Web App.

## 1. Build for Web

To build the project for the web, run:

```bash
flutter build web --release
```

The build artifacts will be in `build/web`.

## 2. Hosting

Telegram Web Apps **must** be served over HTTPS. You can host the contents of `build/web` on any static hosting service like:
- GitHub Pages
- Firebase Hosting
- Vercel
- Netlify

## 3. Telegram Bot Configuration

1.  Open **@BotFather** in Telegram.
2.  Create a new bot (or select an existing one).
3.  Use the `/newapp` command (or Menu Button settings) to link your bot to your hosted Web App URL.
4.  You will be asked for the URL. Enter the HTTPS URL where your app is hosted (e.g., `https://YOUR_WEB_APP_DOMAIN_PLACEHOLDER`).

## 4. Secrets and Placeholders

**IMPORTANT**: This project uses placeholders for sensitive information. You must replace them with your actual values:

-   `TELEGRAM_BOT_TOKEN_PLACEHOLDER`: Your Telegram Bot Token from @BotFather.
-   `YOUR_WEB_APP_DOMAIN_PLACEHOLDER`: The actual HTTPS URL where your app is hosted.

## 5. Testing

### Browser
You can run the app locally in Chrome to verify it works (Telegram features will be disabled but safe):
```bash
flutter run -d chrome
```

### Telegram
1.  Update `telegram_bot_example.py` with your real `TELEGRAM_BOT_TOKEN` and `WEB_APP_URL`.
2.  Run the bot:
    ```bash
    pip install python-telegram-bot
    python telegram_bot_example.py
    ```
3.  Open your bot in Telegram and click the "Open App" button.
4.  Navigate to the "Result" screen (after classifying an image) and try the "Like" / "Dislike" buttons.
5.  Check the bot console for received data.

## 6. Docker Deployment

You can deploy both the bot and the web app using Docker.

1.  Update `docker-compose.yml` (or use environment variables) with your:
    - `TELEGRAM_BOT_TOKEN`
    - `WEB_APP_URL` (The URL where your `web-app` service will be accessible, e.g., via a reverse proxy or tunnel)

2.  Build and run:
    ```bash
    docker-compose up --build
    ```

The web app will be available at `http://localhost:8080`. You will need to expose this to the internet (HTTPS required for Telegram Web Apps) using a tool like `ngrok` or a cloud provider's load balancer.
