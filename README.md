# Flutter Telegram Web App
[![flutter_telegram_web_app version](https://img.shields.io/pub/v/flutter_telegram_web_app?label=flutter_telegram_web_app)](https://pub.dev/packages/flutter_telegram_web_app)

Build telegram web apps in flutter using flutter_telegram_web library

## Getting Started
Import Library in your pubspec.yaml

And add this line in `web/index.html`

```html
<head>
    ....
    <script src="https://telegram.org/js/telegram-web-app.js" defer></script>
</head>
```

Checkout details of available telegram_web apis [here](https://core.telegram.org/bots/webapps#webappinitdata)


## TODO
Add complete documentation, for now checkout `\example` folder

## Setup for development

- To test in telegram while development/debugging, enable debugging in telegram webApp, checkout [this](https://core.telegram.org/bots/webapps#debug-mode-for-web-apps) post
- Then navigate to `\example` folder : `cd example`
- Run web-server : `flutter run -d web-server --web-port 8000 --web-hostname 0.0.0.0`
- Now expose your `localhost:8000` , to internet ,using [ngrok](https://ngrok.com/) or any other alternative
- Use that url to load webapp in telegram, after debugging, host flutterWeb app somewhere and replace the url


## Show the user a button to open a Web App. There are two ways:

1. Show the user a special menu button (near the message input field):
    1. Go to [Bot Father](https://t.me/BotFather)
    2. Select your bot
    3. `Bot Settings` — `Menu Button` — `Specify..`/`Edit menu button URL`
    4. Send url of flutter web app

2. The second way is to send a button with the data that contains field `web_app` with a URL to a Web App from bot :
    ```json
    {
        "text": "Test web_app",
        "web_app": {
            "url": "FLUTTER_WEB_APP_URL"
        }
    }
    ```


## Additional information

This is Just The Initial Version feel free to Contribute or Report any Bug!
