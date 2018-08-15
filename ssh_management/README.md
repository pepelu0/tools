# ssh_management

manage ssh connections

## Installation Steps

1. clone ssh_management folder to %somewhere%/ssh_management
2. add alias like

        alias remote='sh %somewhere%/ssh_management/server.sh'

    to .bash_profile and reload profile

        source ~/.bash_profile

3. config your ssh using ssh_add tool

        sh %somewhere%/ssh_management/ssh_add.sh -u root -p pswd1 -h 10.10.232.163 -r 测试机1
        sh %somewhere%/ssh_management/ssh_add.sh -u root -p pswd2 -h 10.10.232.164 -r 测试机2

4. try to use it with command: remote and select No you want to connect

        > remote

        No   IP               User                 Remark
        1    10.10.232.163    root                 测试机1
        2    10.10.232.164    root                 测试机1

        > 2
        spawn ssh root@10.10.232.164
        root@10.10.232.164's password:
        Last login: Wed Aug 15 16:32:02 2018 from 10.255.3.1
