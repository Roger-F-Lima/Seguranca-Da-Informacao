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

<h1>Como a prática funciona</h1>

Basicamente você escolhe uma rede sem fio que você deseje se conectar de preferência que tenha maior trafego de pacotes, então é usada
a ferramente para desconectar todos os usuários conectados temporariamente, no momento que os dispositivos deles comnectarem-se novamente
na rede a ferramenta pode capturar o hash da senha e daí testa tar várias senhas até achar uma que bata com aquele hash.
