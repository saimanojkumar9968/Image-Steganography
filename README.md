⚙️ Core Features & Modules
1. Sequential LSB Steganography
Converts text payloads into binary streams and sequentially embeds the data into the Least Significant Bit (LSB) of the image's primary color matrix. This ensures the visual integrity of the cover image remains intact.

2. PRNG-Based Scattering (Security Enhancement)
Utilizes Pseudo-Random Number Generation (randperm) driven by a secret user-defined seed. This scatters the message bits unpredictably across the image matrix, neutralizing basic sequential extraction attacks.

3. Cryptographic Layer
Applies a bitwise XOR Cipher to the binary payload prior to embedding. Even if the scattered bits are successfully located, the data cannot be read without the matching cryptographic key.

🛠️ Tools & Prerequisites
Software: MATLAB R2021a or newer (recommended).

Required Toolboxes: Image Processing Toolbox (optional but recommended for advanced image I/O).

Concepts Applied: Matrix Manipulation, Bitwise Operations, Digital Image Processing, Cryptography.

🚀 Getting Started
1. Clone the Repository
2. Standard Steganography (Sequential)
To hide a message using a standard sequential approach:

3. Randomized Steganography (Scattered)
To maximize security by scattering the bits with a seed:

🔮 Future Scope
AES Integration: Replacing the bitwise XOR cipher with the Advanced Encryption Standard (AES) utilizing the current aes_final.m module architecture.

Payload Capacity Checking: Dynamic calculation of Maximum Hiding Capacity (MHC) based on target image resolution.

Visual Fidelity Metrics: Implementing PSNR (Peak Signal-to-Noise Ratio) and MSE (Mean Squared Error) calculations to quantify image distortion.

<div align="center">
<i>Developed by Pallela Sai Manoj Kumar | B.Tech ECE (4th Year)</i>
</div>
