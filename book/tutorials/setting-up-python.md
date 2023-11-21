---
myst:
  substitutions:
    no_macos: "Instructions for macOS are not yet available. 😿"
---

# Installing Python and the Conda package manager

In this tutorial, you will install Python and the other necessary tools on your personal or university-supplied computer, for taking part of the material in this book. You will also verify that the installation works by running a simple Python program.

## Download the installation script

To help with the installation, we will use a script that automates the process.

````{tab-set}
```{tab-item} Windows 10/11
:sync: win
Download the installation script and save it anywhere you like, for instance in the *Downloads* folder: {download}`setup-python.cmd </../bin/setup-python.cmd>`
```

```{tab-item} macOS
:sync: macos
{{ no_macos }}
```
````

## Run the installation script

`````{tab-set}
````{tab-item} Windows 10/11
:sync: win

Double-click the downloaded script file, and wait for it to finish. It will probably take a few minutes. A successful installation should look similar to the following:

```{asciinema} setup-python-win.cast
:speed: 4
```
````
````{tab-item} macOS
:sync: macos
{{ no_macos }}
````
`````

When the installation is finished, close the terminal window.

## Test the installation

To celebrate a successful installation process, we will run a simple Python program that prints the text "Hello, world!" to the screen.

`````{tab-set}
````{tab-item} Windows 10
:sync: win
Right-click the Start Menu and select *Windows PowerShell*. You should see a terminal window with a prompt similar to the following:

```shell
Windows PowerShell

...

(base) PS C:\Users\your-username>
```

````

````{tab-item} Windows 11
:sync: win
Right-click the Start Menu and select *Terminal*. You should see a terminal window with a prompt similar to the following:

```shell
Windows PowerShell

...

(base) PS C:\Users\your-username>
```

````

````{tab-item} macOS
:sync: macos
{{ no_macos }}
````
`````

In the prompt window, type `python` and press the {kbd}`Enter` key. You should now see a prompt starting with `>>>`.

Type `print("Hello, World")` and press the {kbd}`Enter` key. You should now see the text `Hello, World` printed to the screen, just as in the example below:

```{asciinema} python-hello-world.cast
```

You can now close the terminal window.

## Wrapping up

Congratulations! Now you have installed Python and the other tools you will need for taking part of the material in this book. You have also verified that the installation works by running a simple Python program.
