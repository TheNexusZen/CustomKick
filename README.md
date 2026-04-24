# CustomKick (Executor)

A Roblox executor script that performs a **real kick** while fully customizing the **kick screen title and message using RichText and color codes**.

---

## Overview

This script:
- Calls the real `LocalPlayer:Kick()`
- Hooks into `RobloxPromptGui` before/during the kick
- Overrides the default kick UI with:
  - Custom **title**
  - Custom **message**
  - **RichText colors**

---

## Features

- Real kick (player is actually disconnected)  
- Custom title (with length limit)  
- RichText color support  
- Live UI override loop (ensures it applies)  
- Lightweight and executor-friendly  

---

## Usage

### Load the script

    local KickPlayer = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheNexusZen/CustomKick/refs/heads/main/Kick.lua"))()

---

## Basic Example

    KickPlayer("<C=r>BANNED</c>", "<C=w>You have been permanently banned.</c>")

---

## Parameters

| Parameter | Type   | Description |
|----------|--------|-------------|
| `title`  | string | Kick title (supports color tags, max ~15 visible chars) |
| `reason` | string | Kick message (supports color tags) |

---

## Color System

Use this format inside your text:

    <C=letter>Text</c>

### Example:

    KickPlayer("<C=r>ERROR</c>", "<C=w>Something went wrong</c>")

---

## Available Colors

| Code | Color |
|------|------|
| a | Indigo |
| b | Blue |
| c | Cyan |
| d | Dark Olive |
| e | Olive |
| f | Tomato |
| g | Lime |
| h | Light Green |
| i | Ivory |
| j | Khaki |
| k | Black |
| l | Bright Lime |
| m | Pink |
| n | Navy |
| o | Orange |
| p | Magenta |
| q | Maroon |
| r | Red |
| s | Gray |
| t | Teal |
| u | Turquoise |
| v | Violet |
| w | White |
| x | Light Gray |
| y | Yellow |
| z | Steel Blue |

---

## Notes

- The script **removes color tags** before calling the actual kick reason  
- Title is limited to ~15 visible characters (extra gets truncated with `...`)  
- Uses a loop to continuously override the kick UI until disconnect  
- Works by modifying:
  - `RobloxPromptGui`
  - `ErrorPrompt`

---

## Example Variations

    KickPlayer("<C=g>SUCCESS</c>", "<C=w>You passed the check.</c>")

    KickPlayer("<C=r>ACCESS DENIED</c>", "<C=y>Unauthorized client detected.</c>")

    KickPlayer("<C=o>WARNING</c>", "<C=w>Suspicious activity detected.</c>")

---

## Limitations

- UI override depends on timing (very fast kicks may skip styling)  
- Only affects the **local player's kick screen**  
- Requires executor support (`loadstring`, `HttpGet`, `cloneref`)  

---

## Credits

Maintained by Nexus
