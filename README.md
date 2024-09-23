# Minitalk

Minitalk is a simple client-server communication program that uses UNIX signals to transfer messages between processes. The server receives a message from the client, which sends it bit by bit using signals.

## Overview

- **Server**: The server listens for incoming messages, receiving them bit by bit through signals.
- **Client**: The client sends a message to the server, encoding each character as a sequence of bits and sending them via signals.
- **Signals**: Communication between the client and server is done using two signals:
  - `SIGUSR1`: Represents a binary 1.
  - `SIGUSR2`: Represents a binary 0.

### Features

- Communication via signals (`SIGUSR1`, `SIGUSR2`).
- Simple message transfer between client and server processes.
- Displays the server's Process ID (PID), allowing clients to connect and send messages.

## Files

### 1. `server.c`

The server listens for signals from the client and reconstructs the message bit by bit. Once a complete character is received (after 8 bits), it prints the character to the console.

#### Key Components:

- `signal_handler(int signal)`: Handles incoming signals (`SIGUSR1` or `SIGUSR2`), updating the message bit by bit.
- `main()`: Initializes the server, prints its PID, and waits for incoming signals.

### 2. `client.c`

The client sends a message to the server by encoding each character into bits and sending the corresponding signals (`SIGUSR1` for 1, `SIGUSR2` for 0) to the server.

#### Key Components:

- `ft_isdigit(int c)`: Utility function to check if a character is a digit.
- `is_integer(const char *str)`: Checks if a string is a valid integer (used to validate the server PID).
- `ft_atoi(const char *str)`: Converts a string to an integer (used to get the server's PID from the command-line argument).
- `send_message(int PID, char *message)`: Sends a message bit by bit to the server.
- `main(int argc, char **argv)`: Validates arguments (PID and message), and sends the message to the specified server.

### 3. `minitalk.h`

Header file that includes all the necessary libraries and defines for both `client.c` and `server.c`. It also includes the `ft_printf` library for formatted output.

#### Key Libraries:

- `signal.h`: For signal handling.
- `unistd.h`: For system calls like `write()` and `usleep()`.
- `stdlib.h`, `fcntl.h`, `string.h`, `stdio.h`: Standard libraries for system operations and input/output.

### 4. `Makefile`

The `Makefile` automates the compilation process for the client and server programs. It compiles both `client.c` and `server.c`, links the `ft_printf` library, and includes clean-up rules.

#### Key Targets:

- `all`: Builds the `server` and `client` binaries.
- `$(SERVER)`: Compiles `server.c`.
- `$(CLIENT)`: Compiles `client.c`.
- `clean`: Removes the binaries.
- `fclean`: Cleans up all compiled files.
- `re`: Rebuilds everything from scratch.

#### Compilation Example:

```bash
make
```

#### Running the Server:

```bash
./server
```

#### Running the Client:

```bash
./client <server PID> <message>
```

### 5. `ft_printf` Library

A custom implementation of the `printf` function used for formatted output. The Makefile links to this library for both the client and server programs.

## Usage

### Step 1: Compile the Project

To compile the project, run the following command:

```bash
make
```

### Step 2: Run the Server

Start the server to get its Process ID (PID):

```bash
./server
```

You will see the server's PID printed, which you will use to send messages from the client.

### Step 3: Run the Client

Use the client to send a message to the server. The message is sent one bit at a time using signals. The command format is:

```bash
./client <server PID> <message>
```

For example:

```bash
./client 12345 "Hello, Server!"
```

### Step 4: Clean the Project

To remove the binaries:

```bash
make clean
```

To remove binaries and all compiled files:

```bash
make fclean
```

To recompile the entire project:

```bash
make re
```

## License

This project is developed by AbdulAzeez Shobajo. It is from the 42 school project.

---

Feel free to contribute or report any issues you encounter with the project!
