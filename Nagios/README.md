# Nagios

Eesta pártica foi deveras simples para mim tendo em vista que eu já havia feito na disciplina de gerencia de redes nesse semestre
nela eu basicamente refiz os passos que já havia excultado na disciplina, para essa prática eu usei uma distro do Ubuntu 16.04, em
questão de aprendizagem não teve muita cosiderando que eu já havia execultado tal tarefa na disciplina de gerência, mas foi bem
util para praticar e revisar mais algumas coisas sobre a ferramenta, na questão do tempo eu levia cerca de uma hora.

## Prerequisítos

<ul>

   <li>Ubuntu 16.04 (De preferência pois existem mais tutorias para ele, mas é possível usa qualquer distro)</li>
   <li>Nagios instalado</li>

</ul>

## Como Funciona a prática

Primeiramente nós devemos execultar o tutorial de instalação da ferrementa seguindo o passo-a-passo fornecido pelos alunos assim que tudo
estiver terminado podemos ir a comfiguração de monitoramento, para o manitoramento devemos istalar o NRPE e na configuração dele o IP do
servidor que queremos montirar, agora temos de configurar o NAGIOS para monitorar o servidor que queros, vamos na pasta 
/usr/local/nagios/etc/servers se esta não exitir deve ser criado, então criaremos e adicionaremos um arquivo de configuração para o host
a ser monitorado com as linhas mostrados no tutorial, por fim reiniciamos o apache2 e o nagios-nrpe-server no host local e no servidor
monitorado repectivamente e está fucionado.
