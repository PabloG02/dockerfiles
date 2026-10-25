# Common Issues

When running Docker images in Windows using the Ubuntu app, the following issues must be taken into account.

<!-- ::start:accordion -->

## White Spaces in the Path

When running the Ubuntu app in a Windows operating system, the path to the project's directory should not have white spaces. This can be easily avoided when the `<windows_username>` does not have blanks.

If the `<windows_username>` has white spaces, the easiest solution is to create a new user on that computer without white spaces. Alternatively, try using single quotes around folder names that have white spaces (for instance, `/mnt/c/Users/'my account'/Documents/Docker`) which works most of the time.

## File Extensions

If you have created text configuration files or data files (FASTA files, for instance) using Windows applications (such as Notepad), it is likely that the files have the `.txt` extension. Therefore, using the Ubuntu app, it is advisable to navigate to the project's directory:

```bash
cd /mnt/c/Users/<windows_username>/Documents/Project
```

Then list all files in that directory:

```bash
ls
```

If the name of the text configuration file or data file ends in `.txt`, the full name of the file (including the extension) must be typed in the Docker command that you want to run. Some Docker images may not accept a configuration or data file with the `.txt` extension. In those cases, use the `mv` command to rename the file:

```bash
mv name.txt name
```

## Line Endings

Text files created on DOS/Windows machines have different line endings than Unix/Linux files:

- **DOS/Windows:** carriage return and line feed (`\r\n`)
- **Unix/Linux:** line feed only (`\n`)

Some Docker images may fail to run because of this difference. There are two simple solutions:

### Option 1: Using `dos2unix`

1. Install `dos2unix`:

   ```bash
   sudo apt-get install dos2unix
   ```

2. Convert the file:

   ```bash
   dos2unix name.txt
   ```

### Option 2: Using `sed`

Convert line endings directly with `sed`:

```bash
sed -i 's/\r$//' name.txt
```

## End of File Considerations

Some Docker image applications read lines one by one from a text file as a set of instructions.

- **On native Linux:** If there is an extra blank line after the last valid instruction, the application may try to process the blank line as an instruction, leading to errors.
- **On Windows (Ubuntu app / WSL):** An extra blank line is required at the end of the file in order for the application to read the last valid instruction.

<!-- ::end:accordion -->
