import json
import logging
import os
from telegram import Update, KeyboardButton, ReplyKeyboardMarkup, WebAppInfo
from telegram.ext import ApplicationBuilder, ContextTypes, CommandHandler, MessageHandler, filters

# PLACEHOLDERS - Replace with your actual values
TELEGRAM_BOT_TOKEN = os.getenv("TELEGRAM_BOT_TOKEN")
WEB_APP_URL = os.getenv("WEB_APP_URL")

logging.basicConfig(
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    level=logging.INFO
)

async def start(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Sends a message with a button to open the Web App."""
    keyboard = [
        [KeyboardButton(text="Open App", web_app=WebAppInfo(url=WEB_APP_URL))]
    ]
    reply_markup = ReplyKeyboardMarkup(keyboard, resize_keyboard=True)
    await update.message.reply_text("Welcome! Click the button below to launch the app.", reply_markup=reply_markup)

async def web_app_data(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Handles data sent from the Web App."""
    data = json.loads(update.effective_message.web_app_data.data)
    await update.message.reply_text(f"Received data from Web App:\n{json.dumps(data, indent=2)}")
    print(f"Received data: {data}")

if __name__ == '__main__':
    if TELEGRAM_BOT_TOKEN == "TELEGRAM_BOT_TOKEN_PLACEHOLDER":
        print("Error: Please replace TELEGRAM_BOT_TOKEN_PLACEHOLDER with your actual bot token.")
        exit(1)

    application = ApplicationBuilder().token(TELEGRAM_BOT_TOKEN).build()

    start_handler = CommandHandler('start', start)
    web_app_handler = MessageHandler(filters.StatusUpdate.WEB_APP_DATA, web_app_data)

    application.add_handler(start_handler)
    application.add_handler(web_app_handler)

    print("Bot is running...")
    application.run_polling()
