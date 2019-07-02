package basi;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLWarning;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Scanner;

public class Test {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner in=new Scanner(System.in);
		int comando;
		try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		String url="jdbc:mysql://localhost:3306/centro sportivo";
		String user="root";
		String pwd="asd456JKL";
		Connection con = DriverManager.getConnection(url,user,pwd);
		
		 for (SQLWarning warn = con.getWarnings(); warn != null; 					warn= warn.getNextWarning()) 
		 {
			 System.out.println("SQL Warning:");
			 System.out.println("State  : " + warn.getSQLState());
			 System.out.println("Message: " + warn.getMessage());
			 System.out.println("Error  : " + warn.getErrorCode());
					      }
			 Query q=new Query(con);
			 
			 boolean flag=true;
			 do {
				 System.out.println("\t\tmenù"+
						 "\n\t0=esci"+
						 "\n\t1=OP1 stipulazione nuovo abbonamento"+
						 "\n\t2=OP2 stampa del numero di persone abbonate aciascun abbonamento"+
						 "\n\t3=OP3 assegnazione di un istruttore a un attività"+
						 "\n\t4=OP4 partecipazione di un cliente a un evento"+
						 "\n\t5=OP5 stampa del numero di clienti partecipanti ciascun evento"+
						 "\n\t6=OP6 cancellazione dei clienti che non rinnovano gli abbonamenti da almeno 1 anno"+
						 "\n\t7=OP7 creazione nuova scheda da seguire"+
						 "\\tn8=OP8 numero di schede formulate da ciascun istruttore"+
						 "\n\t9=OP9 cancellazione di un membro del personale"+
						 "\n\t10=OP10 creazione nuovo abbonamento"+
						 "\n\t11=OP1 stipulazione nuovo abbonamento con nuovo cliente"
						 );
				 System.out.println("Scegli un comando");
				 comando=in.nextInt();
				 switch(comando) {
				 	case 1:
				 		String codA, codF, dataI, dataF;
				 		System.out.println("codice abbonamento");
				 		codA=in.next();
				 		System.out.println("codice fiscale");
				 		codF=in.next();
				 		System.out.println("data inizio");
				 		dataI=in.next();
				 		System.out.println("data fine");
				 		dataF=in.next();
				 		q.op1(codA, codF, dataI, dataF);
				 		break;
				 	case 2:
				 		//stampa OP2
						 ResultSet result=q.op2();
						 System.out.println("OP2:");
						 System.out.println("Codice abbonamento prezzo descrizione tipo numero clienti");
						 while(result.next())
						 System.out.println(result.getString("codice abbonamento")+" 		   "+result.getString("prezzo")+"	  "+result.getString("descrizione")+"      "+result.getString("tipo")+" \t"+result.getString("numero clienti"));
				 		break;
				 	case 3:
				 		System.out.println("codice attività");
				 		String codAttivita=in.next();
				 		System.out.println("codice Istruttore");
				 		String codIstruttore=in.next();
				 		q.op3(codAttivita,codIstruttore );
				 		break;
				 	case 4:
				 		System.out.println("codice fiscale");
				 		codF=in.next();
				 		System.out.println("codice evento");
				 		String codE=in.next();
				 		q.op4(codF, codE);
				 		break;
				 	case 5:
				 		ResultSet res=q.op5();
				 		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
				 		// manca la data
				 		while(res.next())
				 			System.out.println(res.getString(1)+" "+res.getString(3)+" "+res.getInt(4)+" "+res.getInt(5));
				 		break;
				 	case 6:
				 		System.out.println("inserisci data");
				 		String data=in.next();
				 		q.op6(data);
				 		break;
				 	case 7:
				 		System.out.println("codice scheda");
				 		String codS=in.next();
				 		System.out.println("durata");
				 		int durata=in.nextInt();
				 		System.out.println("ripetizioni");
				 		int ripetizioni=in.nextInt();
				 		System.out.println("codice istruttore");
				 		String codI=in.next();
				 		q.op7(codS, durata, ripetizioni, codI);
				 		break;
				 	case 8: 
				 		res=q.op8();
				 		while(res.next())
				 			System.out.println(res.getString(1)+" "+res.getString(2)+" "+res.getString(3)+" "+res.getInt(15));
				 		break;
				 	case 9:
				 		System.out.println("codice scheda");
				 		codF=in.next();
				 		q.op9(codF);
				 		break;
				 	case 10:
				 		String desc,tipo;
				 		System.out.println("codice abbonamento");
				 		codA=in.next();
				 		System.out.println("descrizione");
				 		desc=in.next();
				 		System.out.println("tipo");
				 		tipo=in.next();
				 		System.out.println("prezzo");
				 		double prezzo=in.nextDouble();
				 		q.op10(codA, prezzo, desc, tipo);
				 		break;
				 	case 11:
				 		
				 		System.out.println("codice abbonamento");
				 		codA=in.next();
				 		System.out.println("codice fiscale");
				 		codF=in.next();
				 		System.out.println("data inizio");
				 		dataI=in.next();
				 		System.out.println("data fine");
				 		dataF=in.next();
				 		q.op1(codA, codF, dataI, dataF, "g", "p", "a", "a", 23, "1998-02-10", "avellino");
				 		break;
				 	default:
				 		flag=false;
				 		break;
				 }
				 
			 }while(flag);
		 }
		
		
		
		 catch (SQLException se) {
		    System.out.println("SQL Exception:");
		
		  // Verifica delle eventuali eccezioni SQL
		  while (se != null) {
		    System.out.println("State  : " + se.getSQLState());
		System.out.println("Message: " + se.getMessage());
		System.out.println("Error  : " + se.getErrorCode());
		
		    se = se.getNextException();
		    }
		}
		catch(Exception e) {
			System.out.println("ok");
		}
	}

}
