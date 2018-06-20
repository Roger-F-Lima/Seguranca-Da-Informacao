<h1>Invadindo Redes Wi-Fi WPA2</h1>

Essa prática era bem simples, eu já tinha testado algo semelhate antes de fazer a disciplina, porém asando a distribuição Arch Linux
com adição de alguns repositórios das distro BlackArch que é usadad para teste de invasão, eu fiz a prática usando o roteador da
minha própria casa, acabou demorando um pouco pois a minha senha era mais complexa, paticulamente eu gostei da prática pude
aprender um pouco mais sobre redes wifi o que é muito util para o meu curso.

<h1>Pré-requisitos</h1>
<ul>
<li>Kali Linux;</li>
<li>Adaptador Wi-Fi USB (Apenas em caso de máquina virtual);</li>
<li>Ferramenta aircrack-ng (No caso de usar outra distro que não seja o kali).</li>
</ul>

<h1>Ferramentas Utilizadas</h1>
<p>
<strong>AIRMON-NG CHECK KILL</strong><br />
Verifica quais processos precisam receberem o kill (matar) e dá um kill nos processos necessários.<br />
</p>
<p>
<strong>IWCONFIG</strong><br />
O iwconfig é similar ao comando ifconfig, mas é usado para redes wifi. Com este comando pode-se verificar diversas características das redes wireless.<br />
</p>
<p>
<strong>AIRMON-NG</strong><br />
Esta é a ferramenta para colocarmos nossa placa de rede wireless no estado monitor! Devemos fazer isso antes de começar a capturar pacotes da rede wireless. <br />
</p>
<p>
<strong>AIRODUMP-NG</strong><br />
Sua principal finalidade é capturar e coletar ivs (Initialization Vectors) dos pacotes WEP.<br />
</p>
<p>
<strong>AIRCRACK-NG</strong><br />
A partir dos dados coletados pelo airodump-ng usaremos esta ferramenta para sabermos qual chave esse pacote WEP que capturamos está usando.<br />
</p>
<p>
<strong>AIREPLAY-NG</strong><br />
A função principal é gerar tráfego para uso posterior no aircrack-ng para quebrar chaves WEP e WPA-PSK. Esta ferramenta nos dá cinco maneiras diferentes de atacar. O programa aireplay-ng classifica da seguinte maneira:<br />
</p>
<ul>
<li><strong>Desautenticação:</strong> Faz com que o usuário conectado ao AP (Access Point) desautentique e volte a conectar, fazendo assim que ele faça uma nova requisição ARP e enviar um novo handshake.</li>
<li><strong>Autenticação falsa:</strong> Este ataque funciona com êxito quando temos um cliente conectado ao AP, caso não tenha, faremos uma cliente para conectar a esse AP. Mas lembre-se, é melhor quando temos uma cliente conectado ao AP, pois assim geraremos tráfego ARP.</li>
<li><strong>Seleção interativa do pacote a enviar:</strong> Ele pode selecionar um pacote qualquer e enviá-lo.</li>
<li><strong>Reinjeção de requisição ARP:</strong> É o mais efetivo para gerar IVs. Este ataque requer um MAC de um cliente associado ou um MAC falso. Este ataque pode demorar bastante, até que apareça a requisição ARP, ele falhará rapidamente se não houver tráfego. </li>
<li><strong>Ataque de KoreK chopchop:</strong> Este ataque é ótimo quando bem sucedido, pois ele desencripta um pacote WEP sem conhecer a sua chave e também pode usar uma WEP dinâmica.</li>
</ul>

<h1>Como a prática funciona</h1>

Basicamente você escolhe uma rede sem fio que você deseje se conectar de preferência que tenha maior trafego de pacotes, então é usada
a ferramente para desconectar todos os usuários conectados temporariamente, no momento que os dispositivos deles comnectarem-se novamente
na rede a ferramenta pode capturar o hash da senha e daí testa tar várias senhas até achar uma que bata com aquele hash.
