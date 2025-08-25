# 🏰 Keys of Freedom Game


---

## 📖 Description  
**Keys of Freedom Game** is a **2D dungeon-style platformer** built with **Godot 4**.  
The player must navigate through dungeon levels, **collect keys**, avoid traps and enemies, and finally **reach the exit door**.  

To make the journey more immersive, a **prisoner NPC (princess)** sends short **AI-generated motivational hints** whenever the player collects a key.  

---

## 🎮 Gameplay Features  
- 👨‍🦱 **Player Movement**: Smooth walking, jumping, and attacking.  
- 🔑 **Key Collection**: Gather all keys to unlock the final door.  
- 🚪 **Doors**:  
  - **Door1** → Moves the player from **Level 1 → Level 2**.  
  - **Door2** → Triggers the **Victory Message** once all keys are collected.  
- 🧌 **Enemies**: Patrol, attack, and can be defeated by the player.  
- ☠️ **Traps**: Spikes and hazards that kill the player if touched.  
- 👑 **Prisoner NPC (Princess)**: AI-powered hints and encouragement.  
- ❤️ **Health System**: Player has limited lives and can die if health reaches zero.  

---

## 🤖 Artificial Intelligence Integration  
- Powered by the **NobodyWho AI** library.  
- Each time a key is collected → a **new motivational message** is displayed.  
- Messages are **short, dynamic, and limited to 12 words**.  
- Enhances immersion and replayability.  

---

## 🛠️ Technologies Used  
- **Godot 4** – Game Engine  
- **GDScript** – Game logic (Player, Enemy, Doors, Keys, NPC)  
- **NobodyWho AI** – Dynamic motivational hints  
- **Tilemap & Tileset** – Dungeon and environment design  
- **AnimatedSprite2D** – Player, enemy, and NPC animations  
- **AudioStreamPlayer** – Background music and sound effects  



## 🖼️ Screenshots  
![Gameplay Screenshot 1]
<img width="1155" height="654" alt="image (3)" src="https://github.com/user-attachments/assets/70b60eed-7ff2-4cdd-ab67-f72c132cae9e" />

![Gameplay Screenshot 2]   
<img width="1160" height="660" alt="image (4)" src="https://github.com/user-attachments/assets/263cf980-fef5-450b-bcf4-4a81e636b1ea" />

---

## 🎥 Demo Video  
[▶ Watch Gameplay Demo](https://www.loom.com/share/d0f30195e11e4122ac3ef02719870259?sid=ac212d68-6293-45d0-9812-721b2a82baf4) 

---
## Report 
👉 [https://docs.google.com/document/d/11dPIDX5BczmvEYmVRNX4jy1k8BXRhNvqASJtwC1-nBU/edit?tab=t.0]

---
## 🚀 How to Run :

1. Clone this repository:  
   ```bash
   git clone https://github.com/areenshamasni/AIActionGame.git
   ```

   
2. And you can install the game in:
 
[https://drive.google.com/drive/folders/1WGOxHDMjOc4mLpG73WMJrZcUwm4aDhkl?usp=sharing]

3. Open this folder in Godot to run the project from source.


4. Install NobodyWho (required for AI NPC).


5. Download the HuggingFace model:


👉 gemma-2-2b-it-Q4_K_M-GGUF

6. Place the downloaded model file inside the cloned repository folder.


