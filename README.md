# Vertere.gd
> Vertere.gd is a powerful GDScript plugin for the Godot Engine designed to simplify the internationalization process of your games. This tutorial will guide you through the steps to install Vertere.gd via the Asset Library and how to use it in your project for dynamic text translation.

## Table of Contents

- [Introduction](#introduction)
- [Installation](#installation)
- [Setup](#setup)
- [Using Vertere.gd in Your Project](#using-verteregd-in-your-project)
- [Conclusion](#conclusion)

## Introduction

Vertere.gd transforms your Godot projects by adding robust internationalization capabilities directly within the Godot Editor. It offers an intuitive interface for managing multiple languages, aiming to make your game globally accessible without the need for external tools. Vertere.gd streamlines the localization process through an easy-to-use GDScript plugin, enabling dynamic text translation in a variety of languages with minimal setup.

### Features:

- Seamless integration with the Godot Asset Library for straightforward installation.
- Activation through Godot's Project Settings, ensuring the plugin is readily available across your project.
- Autoload feature for "Vertere" and "Utils," making internationalization functions accessible globally within your project.
- Comprehensive support for creating and managing language dictionaries directly in GDScript, allowing for quick setup and iteration of localized content.
- Ability to set and change locales on the fly, catering to a global audience by accommodating their language preferences.
- Dynamic text translation using simple GDScript functions, supporting placeholders for personalized content.
- Enhanced project organization by allowing developers to focus on game development rather than worrying about localization details.

All functionalities are designed with performance and ease of use in mind, ensuring a smooth and lag-free experience. The plugin's settings and features can be easily customized through the Godot Editor, allowing developers to tailor the internationalization process to their specific needs. Vertere.gd is an essential tool for developers looking to expand their game's reach to a global audience.

## Installation

1. **Open Godot Editor**: Launch the Godot Editor and open your project.
2. **Access Asset Library**: Click on the **AssetLib** tab at the top of the editor.
3. **Search for Vertere.gd**: In the Asset Library, use the search bar to find "Vertere.gd". 
4. **Install Plugin**: Click on the Vertere.gd plugin from the search results, and press the **Install** button. Follow the prompts to install it into your project.

## Setup

After installation, you need to activate the plugin and set it up for use in your project:

1. **Activate Plugin**: Go to **Project > Project Settings > Plugins** and find Vertere.gd in the list. Change its status to **Enable**.
2. **Autoload Setup**: For easy access across your project, "Vertere" and "Utils" should be set as autoload scripts automatically. However, if you need to set them manually, follow these steps:
   - Go to **Project > Project Settings > Autoload**.
   - Click the folder icon next to the Path field, navigate to the "Vertere" script, and select it.
   - Enter "Vertere" as the Node Name and click the **Add** button.
   - Repeat the process for "Utils" by navigating to the "Utils" script, selecting it, entering "Utils" as the Node Name, and clicking **Add**.
   - This will add them to the autoload scripts, making them globally accessible across your project.

## Using Vertere.gd in Your Project

With Vertere.gd set up, you can now start localizing your project. Below is an example of how to use Vertere for localization:

```gdscript
extends Node

# Vertere instance for handling localization.
# It holds the dictionaries for each language.
onready var Vertere = get_node("/root/Vertere")

func _ready():
    # Define dictionaries for each language
    var i18n = Vertere.create({
        "en": {
            "intro": {
                "welcome": "Welcome, {{name}}!",
                "text": "I hope you find this useful!"
            }
        },
        "pt": {
            "intro": {
                "welcome": "Bem-vindo, {{name}}!",
                "text": "Eu espero que ache isso útil!"
            }
        }
    })
    
    # Set the locale to Portuguese
    var _locale = i18n.set_locale("pt")
    
    # Translate text
    var _welcome = i18n.translate("intro.welcome", {"name": "meluiz"})
    var _text = i18n.translate("intro.text", {"name": "meluiz"})
    
    print(_welcome) # Prints: Bem-vindo, meluiz!
    print(_text)    # Prints: Eu espero que ache isso útil!

    # Update GUI elements with translated text
    $TitleLabel.text = _welcome
    $ContentLabel.text = _text
```

## Conclusion

Vertere.gd makes it easier to manage multiple languages in your Godot projects, enhancing the accessibility and international reach of your games. Follow this guide to integrate Vertere.gd into your project and begin your journey towards creating more inclusive and global gaming experiences.
