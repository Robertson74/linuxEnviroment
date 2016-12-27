# __PHP Enviroment Setup__ (with example project)

This document will walkthrough setting up a NMA production-like enviroment for 
software development using virtual machines.
As of 12/27/2016 this enviroment consists of:

- A web server named "web" running ubunutu 14.04 with the following tools
    - Apache2
    - PHP5
    - Composer (PHP Package manager)
    - git

- A Database server named "db" running ubuntu 16.04 with the following tools
    - MySQL 5.7

This following files should be included with this markdown:
- Vagrantfile
- dbBootstrap.sh
- webBootstrap.sh
- php_enviroment_setup.md (This file)

    

## BEFORE YOU BEGIN
You must have "Vagrant" installed with a virtual machine provider (recommended 
is "oracle virtual box", which can be automatically installed by Vagrant)

You must have directories for vagrant to sync files to the respective virtual 
machines. By default these are "~/vms/dev/webRepos" for the "web" virtual 
machine and "~/vms/dev/dbRepos" for the database server. **If you do not have 
these directories you must create them before set up.**

<br>

## Setting up the virtual machines

1. Using the terminal naviagte to the directory containing all of the files listed
above.
2. run the command: "`vagrant up`" 
3. You will be asked to enter the default password for your database on the "db"
virtual machine. Enter the password at the prompt "Enter desired root database 
password:"
4. You *may* be asked to enter your machine's password during setup. If so enter
it at the prompt

The virtual machines will now began to create themselves. These may take several
minutes to complete, no additional input from the user is required.
<br>
When the setup is complete you can run the command: "`vagrant global-status`" to 
confirm that the virtual machines were successfully created. You should see
entries for "web" and "db" similar to the following:
<br>
<br>
```
d739d25  web     virtualbox running  /Users/<yourUser>/vms/dev/repos/phpEnvVagrant
cad4598  db      virtualbox running  /Users/<yourUser>/vms/dev/repos/phpEnvVagrant
```


## Working with the virtual machines
From the directory containing the file "Vagrantfile" you can run the following
commands to work with the two virtual machines:

<table>
    <tr>
        <th width="15%">
            Command
        </th>
        <th width="15%">
            Example
        </th>
        <th>
            Explanation
        </th>
    </tr>
    <tr>
        <td>
            vagrant ssh &ltbox&gt
        </td>
        <td>
            vagrant ssh db
        </td>
        <td>
            Start a SSH session connecting to the given virtual machine.
        </td>
    </tr>
    <tr>
        <td>
            vagrant up &ltbox&gt
        </td>
        <td>
            vagrant up web
        </td>
        <td>
            Start up the virtual machine if it is stopped. "vagrant up" with no
            box specified brings up both virtual machines
        </td>
    </tr>
    <tr>
        <td>
            vagrant halt &ltbox&gt
        </td>
        <td>
            vagrant halt db
        </td>
        <td>
            Stop the given vritual machines. "vagrant halt" with no box 
            specified stops both virtual machines
        </td>
    </tr> 
</table>

<p>You now have two virtual machines simulating the web and database servers of a 
production enviroment at NMA. The rest of this document will cover setting up 
an example project to demostrate the general feel of setting up a PHP symfony 
project.</p>

<br>

## Setting up a PHP Symfony Project
<p>This example will use the web verion of the Agent Portal. As of 12/26/2016 this
project can be found at:
<br>
http://bitbucket.nma:7990/projects/AP/repos/agentportal/browse
</p>

<p>First there must be a database for the project to use on the database
server.</p>

1. ssh into the database server using: `vagrant ssh db`
2. access the MySQL application using: `mysql -u root -p`
3. Enter the default database password used to during the setup process
4. Create a new project database using: `CREATE DATABASE agentPortal;`
5. Exit out of the MySQL application using: `exit`
6. Exit out of the SSH session using: `exit`

<p> There is now a database called "agentPortal" accessisble on the "db" server.
(default ip address "192.168.13.201", default user "root")

<p>Now the project must be downloaded and set up. </p>

1. Ssh into the web server using: `vagrant ssh web` 
2. Navigate to the shared folder using: `cd /var/www/html/webRepos`
3. Clone the Agent Portal repo using: 
`git clone http://bitbucket.nma:7990/scm/ap/agentportal.git`
4. Enter your bitbucket username and password at the prompts
5. Navigate to the newly created directory: `cd agentPortal`
6. a. If there is a newInstall.sh located in the scripts/ directory, run that using
: `bash newInstall.sh`
<br>
b.If there is no such script manually set up the project using `composer install`
    - Follow the prompts to set up default values for the project. Some parameters 
can use the default values by simply hitting enter at the prompt, others may 
need specific inputs from the user. These include:
        - Username and password for bitbucket repos
        - database_host ip address (default 192.168.13.201)
        - database_name ("agentPortal" in this example)
        - database_user ("root" in this example)
        - database_password (default database password used during the setup proccess)
        - nma_filemaker.password (ask php or filemaker team for nmaapi password 
         if needed)
    - Install assets for the project using: `app/console assets:install --symlink`
    <br>
      (if this command does not work try `bin/console assets:install --symlink`)