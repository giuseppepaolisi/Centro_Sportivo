package basi;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Random;

public class Query {
	private Connection con;
	public Query(Connection con) {
		this.con=con;
	}
	//OP1 stipulazione nuovo abbonamento
	public void op1(String codA,String codF,String dataI,String dataF) throws SQLException {
		PreparedStatement pquery=con.prepareStatement("insert into stipula(`codice fiscale`,`codice abbonamento`,`data inizio`,`data fine`) values('"+codF+"','"+codA+"','"+dataI+"','"+dataF+"')");
		pquery.executeUpdate();
		pquery=con.prepareStatement("update abbonamenti\r\n" + 
				"set `numero clienti`=`numero clienti`+1");
		pquery.executeUpdate();
	}
	//OP1 stipulazione nuovo abbonamento con nuovo cliente
	public void op1(String codA,String codF,String dataI,String dataF,String nome,String cognome,String citta, String via,int numC,String dataN,String luogoN) throws SQLException {
		PreparedStatement pquery=con.prepareStatement("insert into clienti(`codice fiscale`,`nome`,`cognome`,`citta`,via,`numero civico`,`data nascita`,`luogo nascita`) values('"+codF+"','"+nome+"','"+cognome+"','"+citta+"','"+via+"','"+numC+"','"+dataN+"','"+luogoN+"')");
		pquery.executeUpdate();
		op1(codA,codF,dataI,dataF);
	}
	
	//OP2 stampa del numero di persone abbonate aciascun abbonamento
	public ResultSet op2() throws SQLException {
		PreparedStatement pquery=con.prepareStatement("select * from abbonamenti");
		ResultSet result=pquery.executeQuery();
		return result;
	}
	
	//OP3 assegnazione di un istruttore a un attività
	public void op3(String codAttivita,String codIstruttore) throws SQLException {
		PreparedStatement pquery=con.prepareStatement("update personale set attivita='"+codAttivita+"' where '"+codIstruttore+"'=`codice fiscale`");
		pquery.executeUpdate();
	}
	
	//OP4 partecipazione di un cliente a un evento
	public void op4(String cod,String evento) throws SQLException {
		PreparedStatement pquery=con.prepareStatement("insert into partecipa(`codice fiscale`,`codice evento`) values('"+cod+"','"+evento+"')");
		pquery.executeUpdate();
		pquery=con.prepareStatement("update eventi\r\n" + 
				"set `numero iscritti`= `numero iscritti`+1");
		pquery.executeUpdate();
	}
	
	//OP5 stampa del numero di clienti partecipanti ciascun evento
	public ResultSet op5() throws SQLException {
		PreparedStatement pquery=con.prepareStatement("select * from eventi join (select `codice evento`,count(`codice evento`) as n from partecipa group by `codice evento`) as a on eventi.`codice evento`=a.`codice evento` ");
		ResultSet result=pquery.executeQuery();
		return result;
	}
	
	//OP6 cancellazione dei clienti che non rinnovano gli abbonamenti da almeno 1 anno
	public void op6(String data) throws SQLException {
		PreparedStatement pquery=con.prepareStatement("delete from clienti\r\n" + 
				"where  `codice fiscale` in(\r\n" + 
				"	select `codice fiscale`\r\n" + 
				"    from(\r\n" + 
				"		select `codice fiscale`,max(`data fine`) as `ultimo abbonamento`\r\n" + 
				"		from stipula\r\n" + 
				"		group by `codice fiscale`\r\n" + 
				"		having `ultimo abbonamento`<='"+data+"'\r\n" + 
				"        ) as a\r\n" + 
				"    )");
		pquery.executeUpdate();
	}
	
	//OP7 creazione nuova scheda da seguire
	public void op7(String codS,int durata,int ripetizioni,String codI) throws SQLException {
		PreparedStatement pquery=con.prepareStatement("insert into schede(`codice scheda`,`durata (settimane)`,`numero ripetizioni`,`cod istruttore`) values('"+codS+"','"+durata+"','"+ripetizioni+"','"+codI+"')");
		pquery.executeUpdate();
	}
	
	//OP8 numero di schede formulate da ciascun istruttore
	public ResultSet op8() throws SQLException {
		PreparedStatement pquery=con.prepareStatement("select * from personale join (select `cod istruttore`,count(`cod istruttore`) from schede group by `cod istruttore`) as a on personale.`codice fiscale`=a.`cod istruttore` where tipo='istruttore'");
		ResultSet result=pquery.executeQuery();
		return result;
	}
	
	//OP9 cancellazione di un membro del personale
	public void op9(String codF) throws SQLException {
		PreparedStatement pquery=con.prepareStatement("delete from personale where `codice fiscale`='"+codF+"'");
		pquery.executeUpdate();
	}
	
	//OP10 creazione nuovo abbonamento
	public void op10(String codA,double prezzo,String desc,String tipo) throws SQLException {
		PreparedStatement pquery=con.prepareStatement("insert into abbonamenti(`codice abbonamento`,prezzo,descrizione,tipo) values('"+codA+"','"+prezzo+"','"+desc+"','"+tipo+"')");
		pquery.executeUpdate();

	}
	
	public ResultSet stampaTabella(String nome) throws SQLException {
		PreparedStatement pquery=con.prepareStatement("select * from "+nome);
		ResultSet result=pquery.executeQuery();
		return result;
	}
	
}
