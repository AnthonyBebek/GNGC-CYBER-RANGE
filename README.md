
### Overview

This is the server files for a GNGC Cyber Range project, these files include challanges hosted on the server and any server maintance files.

These files will never be pushed towards development and are only used for a long project.


### Setup
Run these commands on a Ubuntu Linux PC with internet connection
- git clone https://github.com/Fox2low/GNGC-CYBER-RANGE
- bash setup.sh
- bash start.sh

To edit settings for the challanges 
- Navigate to ~/GNGC-CYBER-RANGE/GNGC_CYBER_RANGE_SCRIPTS

To shutdown server
- stop.sh


### Task list
#### The GNGC Cyber Range - Tasklist
- [x] Github Repository Setup
- [x] Github - VS Code Intergration Setup
- [x] Maintance Scripts
    - [x] Create setup file
    - [x] Create setupcheck file
    - [x] Create startserver file
    - [x] Create setupDB file
    - [x] Create custom commands file
- [ ] Full Network Connectivity
    - [ ] Basic Network structure designed
    - [ ] Switch / Router Setup
    - [x] Ubuntu Server setup
    - [ ] Basic Kali installation installed on all clients.
- [ ] Basic Network Services
    - [x] DHCP pools setup / Configured
    - [ ] DNS Setup / Configured
    - [ ] WSGI Server Setup / Configured
    - [x] SQL Server Setup / Configured.
- [ ] Simple Challenges
    - [ ] Simple Command Line Challenges

**-- Everything from this point on should be completed in Assignment 3 --**

- [ ] Advanced Challenges
    - [ ] Advanced Command Line Challenges
    - [ ] Dynamic Web Challenges
    - [ ] OINST Challenges
    - [ ] Networking Challenges
    - [ ] Programming Challenges
    - [ ] Digital Forensics Challenges
    - [ ] Cryptography Challenges

[comment]: <> (Please work on this Om)
#### GNGC Cyber Range Web Component - Tasklist
- [x] Github Repository Setup
- [x] Github - VS Code Intergration Setup
- [ ] Finished tasklist on Readme file
- [ ] Basic Frontned
    - [ ] Website Design
    - [ ] Basic HTML and CSS
    - [ ] The structure of home page
- [ ] Database
    - [x] Creating MariaDB database
    - [ ] Creating database model in sqlalchemy
- [ ] Implementing features 
    - [X] Login and signup 
    - [ ] Basic home and dashboard page
- [ ] Planning challenges
    - [ ] Basic web based challanges planned out
- [ ] Implementing challenges 
    - [ ] HTML, CSS and JS challanges created and running
    - [ ] Python challanges created and running
- [ ] Cleaning and polishing
    - [ ] Cleaning up code and making it more efficient
    - [ ] Self testing to plug any leaks and protect from errors
- [ ] User Testing
    - [ ] Have a group of users test program
    - [ ] From experienced cyber users to beginners
    - [ ] Make improvements
    - [ ] Final Checks


### File Structure
- GNGC_CYBER_RANGE_SCRIPTS
    - Python scripts that hold external challanges
- GNGC_CYBER_RANGE_WEBSITE
    - Flask website
    -   All HTML pages
- Maintance_Scripts
   - Setup scripts
   - Debug scripts
   - Server Maintance scripts
