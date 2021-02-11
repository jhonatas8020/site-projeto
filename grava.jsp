<%@page language="java" import="java.sql.*" %>

<%

	// cria as variaveis e obtem os dados digitados pelo usuario
	String vnome  = request.getParameter("txtnome");
	String vemail = request.getParameter("txtemail");
	int    vtelefone = Integer.parseInt( request.getParameter("txttel") );
	String vmensagem = request.getParameter("mensagem");

	// variaveis para acessar o banco de dados
	String banco   = "projeto";
	String usuario = "root";
	String senha   = "";
	String url     = "jdbc:mysql://localhost:3306/" + banco;
	String driver  = "com.mysql.jdbc.Driver";

	// carrega o driver na memoria
	Class.forName( driver );

	// criar variavel para conectar com banco de dados
	Connection conexao ; 

	// abrir a conexao com o banco 
	conexao = DriverManager.getConnection( url , usuario , senha ) ;

	String sql = "insert into contato (nome,email,telefone,mensagem) values('" + vnome + "','" + vemail + "'," + vtelefone  + ",'" + vmensagem  + "')" ;

	// cria o statement 
	// ele é o responsável por executar o comando do SQL
	Statement stm = conexao.createStatement() ;

	// executa o comando do SQL
	stm.executeUpdate( sql ) ;

	stm.close() ;
	conexao.close() ;

	out.print("<br><br>") ;
	out.print("Dados enviados com sucesso!!!") ;

	out.print("<br><br>") ;
	out.print("<a href='index.html'>Voltar</a>") ;

%>