## Installing Docker

<!-- ::start:tabs -->

### Windows

To install Docker in Windows, please follow these instructions before following the Linux installation instructions given in the Linux tab. Please note that during software installation, you may need to restart the Ubuntu console or the computer itself, before proceeding to the next step. Therefore, try these solutions first if you find any problems.

1. #### Enable Virtualization Option

   The following approach requires that the virtualization option is enabled in your BIOS, which is the case for most recent laptops. To enable this option, follow the instructions provided in this [guide](https://support.microsoft.com/en-us/windows/enable-virtualization-on-windows-11-pcs-c5578302-6e43-4b4b-a449-8ced115f58e1).

2. #### Install Windows Subsystem Linux

   Open a PowerShell prompt as an Administrator and run the following command:

   ```powershell
   wsl --install
   ```

3. #### Install Ubuntu using the Microsoft Store

   To install Ubuntu you can use the following link: [Ubuntu](ms-windows-store://pdp?productid=9pdxgncfsczv&mode=mini)

   As an alternative, press the Windows button, type “Microsoft Store” in the search bar, and run the application. In the “Microsoft Store” search bar, type Ubuntu, choose the distribution you want, and then click on the “Get” button. During the installation, you will be asked to give a name to the super user account, that could be different from the name of your Windows account, and set the respective password.

   Once the installation is completed, a new app, named "Ubuntu” will be available, that can be accessed by pressing the Windows button, typing “Ubuntu” in the search bar, and running the application. When this is done, a command line terminal appears.

   Now that you have Ubuntu installed, you can follow the Linux steps in the Ubuntu terminal. All your Windows directories will be mounted in the `/mnt` directory. For instance, if your project's directory is `C:/Users/<windows_username>/Documents/Project`, inside Ubuntu it will be `/mnt/c/Users/<windows_username>/Documents/Project`. Try to not use whitespaces in the directories you mount into the Docker images (e.x. `Project_example` instead of `Project example`). Users are advised to work under `/mnt/c/Users/<windows_username>/Documents` or below.

### Linux

To install Docker in Linux, please follow the steps below:

1. #### Update Ubuntu repositories

   In the Ubuntu terminal, run the following commands (you will be asked for the super user password):

   ```bash
   sudo apt-get update
   sudo apt-get upgrade
   ```

2. #### Install xorg (Required to run Docker images with graphical interface)

   In the Ubuntu terminal, run the following command (you will be asked for the super user password):

   ```bash
   sudo apt install -y xorg xinit
   ```

3. #### Install Docker

   Run the following commands one by one:

   ```bash
   sudo apt-get install ca-certificates curl
   sudo install -m 0755 -d /etc/apt/keyrings
   sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
   sudo chmod a+r /etc/apt/keyrings/docker.asc
   echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   sudo apt-get update
   sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
   ```

4. #### Change Docker permissions

   Run the following commands one by one so that the user does not need to use sudo to run Docker images:

   ```bash
   sudo groupadd docker
   sudo gpasswd -a $USER docker
   ```

5. #### Test the Docker installation

   Run the following command:

   ```bash
   docker run hello-world
   ```

6. #### Reboot

   Reboot your computer. Docker Images with a graphical interface may not be displayed properly until you reboot your computer.

   > [!NOTE]
   > To run Docker images with a graphical interface, you need to run the following command first:
   >
   > ```bash
   > xhost +
   > ```

You are now ready to run any **pegi3s** Docker image.

### macOS

To install Docker in macOS, please follow the steps below:

> [!NOTE]
> The commands provided for Docker images with a graphical interface will not work on macOS because they rely on Linux-native paths, IPC sockets, and authority files that do not exist or behave differently on macOS, which implies installing XQuartz, but also invoking such Docker commands in a very different way from the one shown for such images. Nevertheless, you can still run the Docker images without a graphical interface by following the steps below.

1. #### Install Homebrew

   In the macOS terminal, run the following command. For more details, see [brew.sh](https://brew.sh/):

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. #### Install Docker using Homebrew

   In the same terminal, run the following command:

   ```bash
   brew install --cask docker
   ```

3. #### Start the Docker daemon

   Open Docker Desktop from your Applications folder. This will make sure that the Docker daemon is running. If not, when attempting to run Docker commands you will get something like:

   ```text
   Cannot connect to the Docker daemon at unix:///Users/<user_name>/.docker/run/docker.sock. Is the docker daemon running?
   ```

4. #### Test the Docker installation

   Run the following command in your terminal:

   ```bash
   docker run hello-world
   ```

5. #### Run pegi3s Docker images

   Create a folder under Documents named Docker. Then, run the following command in your terminal:

   ```bash
   cd /Users/<user_name>/Documents/Docker
   ```

   Put the needed input files in the Docker folder, and adapt and run the command that is given in the webpage. This procedure was tested on a MacBook Pro with an M4 processor to successfully run the test data that is given for Docker images such as muscle and fasttree. If the above instructions fail, usually due to chip incompatibilities, you may try the alternatives given at the [Docker Desktop page](https://docs.docker.com/desktop/setup/install/mac-install/).

You are now ready to run any **pegi3s** Docker image without a graphical interface.

<!-- ::end:tabs -->