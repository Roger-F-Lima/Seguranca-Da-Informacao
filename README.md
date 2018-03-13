# Seguranca-Da-Informacao
UFC
Eu pude aprender um pouco mais sobre matriz que eu não domino tão bem principalmente nessa forma circular que para mim foi a parte mais
difícil, eu pesquisei no google então eu estou falando para ser sinsero pois eu não teria feito sem pesquisar, usei java pois é a liguagem
que mais domino, tive um pouco de duvida na parte de descriptografar, mas atravez de um video eu consegui terminar a tempo.
Segui o codigo.

public class Playfair {

	public static void doPfCopy()
	
	{
		char letters[][] = Cryptool.pfMatrix.getLetters();
		
		for(int i=0;i<25;++i)
			Cryptool.pfCustMatrix[i].setText(String.valueOf(letters[i/5][i%5]));
	}
	
	// A seguinte função gera a matriz 5x5, dada uma palavra-chave do usuário.
	public static void doPfGenerate()
	{
		int i,j;
		
		char ref[] = { 'A','B','C','D','E','F','G','H','I','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};
		
		String keyword = Cryptool.pfKeyword.getText();
		keyword = keyword.replace('J','I');
		keyword = keyword.replace('j','i');
		
		char letters[] = new char[25];
		
		// Comece inserindo todos os caracteres únicos na matriz 5x5.
		// Verifique se o personagem que está sendo adicionado ainda não foi adicionado.
		for(i=0,j=0;i<keyword.length();++i)
			if(String.valueOf(letters).indexOf(keyword.charAt(i)) == -1)
				letters[j++] = keyword.charAt(i);
		
		String newKeyword = new String(letters,0,j);
		
		// converte nossa palavra-chave em maiúscula. por exemplo, uma palavra-chave de
		// abacate seria ABCTE.
		newKeyword = newKeyword.toUpperCase();
		
		// preencha os espaços em branco para o resto da matriz 5x5, qualquer caractere que não seja
		// na palavra-chave.
		for(i=0;i<25;++i)
		{
			if(newKeyword.indexOf(ref[i]) == -1)
			{
				letters[j++] = ref[i];
			}
		}
		
		String strLetters = new String(letters);
		
		strLetters = strLetters.toUpperCase();
		
		// configura as letras da aula Matrix que escrevemos (que desenha a matriz 5x5)
		Cryptool.pfMatrix.setLetters(strLetters.toCharArray());
	}
	
	// a seguinte função criptografa um texto simples para texto cifrado usando playfair.
	public static void doPfEncrypt()
	{
		String plaintext = Cryptool.pfPlainText.getText();
		
		// converte texto sem formatação para cumprir as regras playfair
		plaintext = ppPfPlainText(plaintext);
		
		// converter para maiúsculas
		plaintext = plaintext.toUpperCase();
		
		String ciphertext = "";
		
		// atravesse o texto simples dois caracteres de cada vez, chamando a função 'decodePf' com a matriz, os dois caracteres                 //e um conjunto booleano para significar verdade que 
                //estamos criptografando.
		for(int i=0;i<plaintext.length();i+=2)
		{
			ciphertext = ciphertext.concat(decodePf(Cryptool.pfMatrix.getLetters(), plaintext.charAt(i), plaintext.charAt(i+1), true));
		}
		
		// configure o texto criptografado para a tela para que o usuário possa ver.
		Cryptool.pfCipherText.setText(ciphertext);
	}
	
	public static void doPfDecrypt()
	{
		String ciphertext = Cryptool.custCipherText.getText();
		
		ciphertext = ciphertext.toUpperCase();
		
		String plaintext = "";
		
		char letters[][] = new char[5][5];
		
		for(int i=0;i<25;++i)
		{
			// ao decodificar, verifique a matriz personalizada. se uma letra estiver vazia, adicione um traço para
			// a matriz 5x5, para que a função de descriptografai seja usada.
			if(Cryptool.pfCustMatrix[i].getText().equals(""))
				letters[i/5][i%5] = '-';
			else
				letters[i/5][i%5] = Cryptool.pfCustMatrix[i].getText().charAt(0);
		}		
		
		for(int i=0;i<ciphertext.length();i+=2)
		{
			// chamar decodePf com a matriz, as letras e falsas que significam que queremos descriptografar (as regras são                           //usadas no sentido inverso)
			plaintext = plaintext.concat(decodePf(letters, ciphertext.charAt(i), ciphertext.charAt(i+1), false));
		}
		
		// configure o texto plano para que o usuário possa ver.
		Cryptool.custPlainText.setText(plaintext);		
	}
	
	// A seguinte função converte o texto claro para cumprir as regras do Playfair.
	// Por exemplo, a letra K é removida e substituída por C, e um modelo caractere
	// é colocado entre letras duplas. finalmente, se o número de caracteres de texto claro
	// é estranho, adicione um modelo caractere ao final para torná-lo igual.
	public static String ppPfPlainText(String plaintext)
	{
		String newPlaintext = "";
		
		for(int i=0;i<plaintext.length();++i)
		{
			// se char for K, adicione C ao novo texto sem formatação
			if(plaintext.charAt(i) == 'k')
				newPlaintext = newPlaintext.concat("c");
			// se não se o char atual for igual ao próximo caractere, então adicione um x entre os dois.
			else if((i != (plaintext.length()-1)) && plaintext.charAt(i) == plaintext.charAt(i+1))
			{
				String conversion = String.valueOf(plaintext.charAt(i));
				conversion = conversion.concat("x");
				
				newPlaintext = newPlaintext.concat(conversion);
			}
			// adicione o caractere ao novo texto simples como sempre
			else
				newPlaintext = newPlaintext.concat(String.valueOf(plaintext.charAt(i)));			
		}
		
		// add o modelo de caractere é comprimento é estranho
		if(newPlaintext.length()%2!=0)
			newPlaintext = newPlaintext.concat(String.valueOf("x"));
		
		return newPlaintext;
	}
	
	
	// A seguinte função determina o decodificado e codificado (funciona de ambos os lados)
	// string dada a matriz 5x5.
	public static String decodePf(char[][] matrix, char a, char b, boolean encrypt)
	{
		int row_a=-1, row_b=-1, col_a=-1, col_b=-1;
		int row_c, row_d, col_c, col_d;
		
		char result[] = new char[2];
		
		// Descubra as posições dos caracteres A e B.
		for(int i=0;i<5;++i)
		{
			for(int j=0;j<5;++j)
			{
				if(matrix[i][j] == a)
				{
					row_a = i;
					col_a = j;
				}
				
				if(matrix[i][j] == b)
				{
					row_b = i;
					col_b = j;
				}
			}
		}
		
		// Se um dos caracteres não puder ser encontrado (se tivermos uma matriz incompleta), devolvemos 
		// para notar que não podemos encontrar o par correspondente de letras.
		if((row_a == -1 && col_a == -1) ||
		   (row_b == -1 && col_b == -1))
		{
			result[0] = '-';
			result[1] = '-';
		}
		else
		{
			// se os caracteres estiverem na mesma linha, selecione os dois caracteres à direita de cada (se estiver criptografando)
			// ou à esquerda de cada (se desencripta)
			if(row_a == row_b)
			{
				row_c = row_a;
				col_c = (encrypt ? (col_a+1)%5 : (col_a == 0 ? 4 : (col_a-1)));
				row_d = row_b;
				col_d = (encrypt ? (col_b+1)%5 : (col_b == 0 ? 4 : (col_b-1)));
			}
			// se os caracteres estiverem na mesma coluna, selecione os dois caracteres abaixo se estiver criptografando
			// ou acima se desencriptar
			else if(col_a == col_b)
			{
				row_c = (encrypt ? (row_a+1)%5 : (row_a == 0 ? 4 : (row_a-1)));
				col_c = col_a;
				row_d = (encrypt ? (row_b+1)%5 : (row_b == 0 ? 4 : (row_b-1)));
				col_d = col_b;
			}
			// então os dois caracteres estão em linhas e colunas diferentes, então crie um quadrado usando os dois pontos,
			// e selecione os dois caracteres que criam os dois outros pontos.
			else
			{
				row_c = row_a;
				col_c = col_b;
				row_d = row_b;
				col_d = col_a;
			}
			
			result[0] = matrix[row_c][col_c];
			result[1] = matrix[row_d][col_d];
		}
		
		return new String(result);
	}
}
