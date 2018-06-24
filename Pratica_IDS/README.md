# Prática IDS

Nessa prática eu use a minha máquina windows para o ataque e uma máquina linux para ser a detectora de intrusos eu instale as ferramentas
necessárias para a prática deixei a máquina linux com o snort pude ver o ip do atacante e realmente era o mesmo ip da minha máquina 
windows e o ip do atacado a minha máquina linux.

## Prerrequisitos

<ul>

   <li>Máquina Linux (vitima)</li>
   <li>Máquina Windows (Atacante)</li>
   <li>Ferramenta SNORT</li>
   <li>Simular de Ataque LOIC</li>

</ul>

## Como funciona a prática

Primeiro devemos istalar o snort na máquina linux, como comandos simples de apt-get seguindo os passos do tutórial e fazendos as
configurações necessárias terminado isso reinice o snort, em seguida devemos ir até o arquivo /etc/snort/snort.conf e onde tem esquicrito
(ipvar HOME_NET any) mudaremos o (any) para o ip da máquina linux a ser monitorada, daí fazemos o download do simular de ataque (LOIC)
na máquina windows e com ela simulamos um ataque contra a nossa máquina linux e checamos se o snort faz a detecção.
