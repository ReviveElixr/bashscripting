# General instructions
1. The approach of solving the Problem solely depends on the Candidate
2. Make sure to have Draw.io diagrams for the workflowns and application architecture
3. Every configuration, code written should be pushed on git (Private Repo)
4. Your are not permitted to share the doc with anyone, even with your colleagues
   
Scenario There is a customer who came to you with a problem to have a custom linux command for his operations. Your task is to understand the problem and create a linux command via bash script as per the instructions.
Command name - internsctl Commandversion - v0.1.0
## Section A
1. I want a manual page of command so that I can see the full documentation of the command.
For example if you execute the command
man ls
as output we get the doc and usage guidelines. Similarly if I execute man internsctl I want to see the manual of my command.
2. Each linux command has an option --help which helps the end user to understand the use cases via examples. Similarly if I execute internsctl --help it should provide me the necessary help
3. I want to see version of my command by executing
internsctl --version
## Section B
I want to execute the following command for -
### Part1 | Level Easy
I want to get cpu information of my server through the following command:
    
 
 $ internsctl cpu getinfo
Expected Output -
I want similar output as we get from lscpu command
---
I want to get memory information of my server through the following command:
$ internsctl memory getinfo
Expected Output
I want similar output as we get from free command
### Part2 | Level Intermediate
I want to create a new user on my server through the following command:
$ internsctl user create <username>
Note - above command should create user who can login to linux system and access his home directory
---
I want to list all the regular users present on my server through the following command:
$ internsctl user list
---
If want to list all the users with sudo permissions on my server through the following command:
$ internsctl user list --sudo-only
### Part3 | Advanced Level
By executing below command I want to get some information about a file $ internsctl file getinfo <file-name>
Expected Output [make sure to have the output in following format only] xenonstack@xsd-034:~$ internsctl file getinfo hello.txt
        File: Access: Size(B): Owner:
hellot.txt -rw-r--r-- 5448 xenonstack

Modify: 2020-10-07 20:34:44.616123431 +0530
In case I want only specific information then I must have a provision to use options $ internsctl file getinfo [options] <file-name>
--size, -s to print size
--permissions, -p print file permissions
--owner, o print file owner --last-modified, m
