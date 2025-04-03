#!/bin/bash
echo "Criando diretórios..."

mkdir -p /public
mkdir -p /adm
mkdir -p /vend
mkdir -p /sec

echo "Criando grupos de usuários..."
groupadd GRP_ADM
groupadd GRP_VEND
groupadd GRP_SEC

echo "Criando usuários..."
# Use SHA-512 hashing (modern systems) or mkpasswd if openssl fails
useradd matthews -m -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_ADM
useradd simao -m -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_ADM

useradd filipe -m -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_VEND
useradd pedro -m -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_VEND
useradd tadeu -m -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_VEND

useradd judas -m -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_SEC
useradd andre -m -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_SEC
useradd bartolomeu -m -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_SEC

echo "Especificando permissões dos diretórios..."
chown root:GRP_ADM /adm
chown root:GRP_VEND /vend
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /vend
chmod 770 /sec
chmod 777 /public

echo "Fim!"
