<a name="readme-top"></a>
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]




<!-- PROJECT LOGO -->
<br />
<div align="center">

  <h3 align="center">The GNGC Cyber Range</h3>

  <p align="center">
    This is the server files for a GNGC Cyber Range project
    <br />
    <a href="https://github.com/AnthonyBebek/GNGC-CYBER-RANGE"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/AnthonyBebek/GNGC-CYBER-RANGE">View Demo</a>
    ·
    <a href="https://github.com/AnthonyBebek/GNGC-CYBER-RANGE/issues">Report Bug</a>
    ·
    <a href="https://github.com/AnthonyBebek/GNGC-CYBER-RANGE/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

These are the server files for the Gungahlin College Cyber Range project. These files automatically install the required services for a bare-bones Ubuntu Linux installation.

What does it install:
* MariaDB
* Flask
* SQLAlchemy
* pyMySQL
* MySQLClient
* ValidateEmail
* Python Docker Enviroments

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

This project was built with

* ![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
* ![MariaDB](https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=mariadb&logoColor=white)
* ![Flask](https://img.shields.io/badge/flask-%23000.svg?style=for-the-badge&logo=flask&logoColor=white)
* 	![Jinja](https://img.shields.io/badge/jinja-white.svg?style=for-the-badge&logo=jinja&logoColor=black)
* ![jQuery](https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
### Main Contributiors

Anthony Bebek  
* [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/anthony-bebek-52b30a2b7/)

Om Vedanti

* [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/om-vedanti-75b731258/)

<!-- GETTING STARTED -->

## Getting Started


### Prerequisites

Run these commands before running anything else
```sh
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
```

* Python
  ```sh
  sudo apt-get install python3.8
  ```

* Git
  ```sh
  sudo apt install git
  ```

### Installation

Installing this system assumes that you don't have mariaDB already installed on your system. 

1. Clone the repo
    ``` sh
    git clone https://github.com/AnthonyBebek/GNGC-CYBER-RANGE
    ```

2. Run the setup file
    ``` sh
    cd ./GNGC-CYBER-RANGE
    bash setup.bash
    ```

    Type Y to each prompt to install the setup correctly, if there is an error, report the issue here  <a href="https://github.com/AnthonyBebek/GNGC-CYBER-RANGE/issues">Report Bug</a>

3. Check the setup was ran correctly
    ``` sh
    bash setupcheck.bash
    ```
    If there was an error with a repository, report the issue here  <a href="https://github.com/AnthonyBebek/GNGC-CYBER-RANGE/issues">Report Bug</a>

4. Run the server
    ``` sh
    bash start.sh
    ```

5. Stop the server with
    ``` sh
    bash stop.sh
    ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

This server was written for Gungahlin College, how to use this system can be found within the supplied documentation. 

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

#### The GNGC Cyber Range - Tasklist
- [x] Github Repository Setup
- [x] Github - VS Code Intergration Setup
- [x] Maintance Scripts
    - [x] Create setup file
    - [x] Create setupcheck file
    - [x] Create startserver file
    - [x] Create setupDB file
    - [x] Create custom commands file
- [x] Full Network Connectivity
    - [x] Basic Network structure designed
    - [x] Switch / Router Setup
    - [x] Ubuntu Server setup
    - [x] Basic Kali installation installed on all clients.
- [x] Basic Network Services
    - [x] DHCP pools setup / Configured
    - [x] DNS Setup / Configured
    - [x] WSGI Server Setup / Configured
    - [x] SQL Server Setup / Configured.
- [x] Simple Challenges
    - [x] Simple Command Line Challenges

**-- Everything from this point on has been completed in the implemtation phase of the project --**

- [x] Setting up the GNGC-Router
    - [x] Creating New DHCP pools
    - [x] Adding New Options to DHCP Server
    - [x] Setting up Router Interfaces
    - [x] Adding new DHCP Network
- [x] Setting up the Clients
    - [x] Chaing BIOS Settings to boot off NIC
    - [x] Installing Kali linux on Client PC
    - [x] Cloning Kali PC
    - [x] Using UDP Multicast to push updates to other Clients
- [x] Setting up the Server
    - [x] Installing Debian based linux on server
    - [x] Installing virtual box and dependacies on server
    - [x] Installing Web Server scripts on Server
    - [x] Running and backing up VM's on VBox
    
#### GNGC Cyber Range Web Component - Tasklist
- [x] Github Repository Setup
- [x] Github - VS Code Intergration Setup
- [x] Finished tasklist on Readme file
- [x] Basic Frontned
    - [X] Website Design
    - [x] Basic HTML and CSS
    - [X] The structure of home page
- [X] Database
    - [x] Creating MariaDB database
    - [x] Creating database model in sqlalchemy
- [X] Implementing features 
    - [X] Login and signup 
    - [X] Basic home and dashboard page
    - [x] All Routes planned and done
- [x] Planning challenges
    - [x] Basic web based challanges planned out
- [x] Implementing challenges 
    - [x] HTML, CSS and JS challanges created and running
    - [x] Python challanges created and running
- [x] Cleaning and polishing
    - [x] Cleaning up code and making it more efficient
    - [x] Self testing to plug any leaks and protect from errors
- [x] User Testing
    - [x] Have a group of users test program
    - [x] From experienced cyber users to beginners
    - [x] Make improvements
    - [x] Final Checks

See the [open issues](https://github.com/AnthonyBebek/GNGC-CYBER-RANGE/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>




<!-- CONTACT -->
## Contact

Anthony Bebek - ante@viagi.com
* [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/anthony-bebek-52b30a2b7/)

Om Vedanti - omkvedanti@gmail.com

* [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/om-vedanti-75b731258/)

Project Link: [https://github.com/AnthonyBebek/GNGC-CYBER-RANGE](https://github.com/AnthonyBebek/GNGC-CYBER-RANGE)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/AnthonyBebek/GNGC-CYBER-RANGE.svg?style=for-the-badge
[contributors-url]: https://github.com/AnthonyBebek/GNGC-CYBER-RANGE/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/AnthonyBebek/GNGC-CYBER-RANGE.svg?style=for-the-badge
[forks-url]: https://github.com/AnthonyBebek/GNGC-CYBER-RANGE/network/members
[stars-shield]: https://img.shields.io/github/stars/AnthonyBebek/GNGC-CYBER-RANGE.svg?style=for-the-badge
[stars-url]: https://github.com/AnthonyBebek/GNGC-CYBER-RANGE/stargazers
[issues-shield]: https://img.shields.io/github/issues/AnthonyBebek/GNGC-CYBER-RANGE.svg?style=for-the-badge
[issues-url]: https://github.com/AnthonyBebek/GNGC-CYBER-RANGE/issues
[license-shield]: https://img.shields.io/github/license/AnthonyBebek/GNGC-CYBER-RANGE.svg?style=for-the-badge
[license-url]: https://github.com/AnthonyBebek/GNGC-CYBER-RANGE/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]: images/screenshot.png
[Next.js]: https://img.shields.io/badge/next.js-000000?style=for-the-badge&logo=nextdotjs&logoColor=white
[Next-url]: https://nextjs.org/
[React.js]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[React-url]: https://reactjs.org/
[Vue.js]: https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D
[Vue-url]: https://vuejs.org/
[Angular.io]: https://img.shields.io/badge/Angular-DD0031?style=for-the-badge&logo=angular&logoColor=white
[Angular-url]: https://angular.io/
[Svelte.dev]: https://img.shields.io/badge/Svelte-4A4A55?style=for-the-badge&logo=svelte&logoColor=FF3E00
[Svelte-url]: https://svelte.dev/
[Laravel.com]: https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white
[Laravel-url]: https://laravel.com
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
[JQuery-url]: https://jquery.com 
