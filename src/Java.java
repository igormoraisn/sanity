/*	Universidade Federal de Sergipe
 * 	Igor Nascimento dos Santos
 * 	Gerência e Suporte a Sistemas - DCOMP
 *  Teste de Sanidade com o JDK
 */

import java.util.Random;
import java.io.File;
import java.io.FileWriter;
import java.io.BufferedWriter;
import java.io.IOException;

public class Java{
	private BufferedWriter escreve;
	private FileWriter fw ;
	public Java(String name){
		File arquivo = new File(name);
		
		try {
			arquivo.createNewFile( );
			fw = new FileWriter (arquivo, true);
			escreve = new BufferedWriter( fw );
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public void escreveArquivo(String linha){
		try {
			escreve.write(linha);
			escreve.newLine();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public String string(int num){
		String teste = new String();
		Integer numero;
		numero = num;
		teste = numero.toString();
		try {
			escreve.write(teste);
			teste = "UFS DCOMP";
			escreve.write(teste);
			escreve.write(teste.length());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "string";
		
	}
	public String random(){
		Random input = new Random();
		input.nextInt(100);
		return "random";
	}
	public String math(){
		String teste;
		teste = "" + Math.PI;
		try {
			escreve.write(teste);
			teste = "" + Math.cos(90) + Math.sin(45);
			escreve.write(teste);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "math";
	}
	public void fechaArquivo(){
		try {
			escreve.close();
			fw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args){
		Java java = new Java("java.txt");
		String complemento;
		complemento = java.string(12435434);
		java.escreveArquivo(complemento);
		complemento = java.random();
		java.escreveArquivo(complemento);
		complemento = java.math();
		java.escreveArquivo(complemento);
		java.fechaArquivo();
	}
	
}
